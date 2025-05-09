package com.example.mfu.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.mfu.dto.Board;
import com.example.mfu.dto.BoardFile;
import com.example.mfu.dto.BoardForm;
import com.example.mfu.exception.AddBoardException;
import com.example.mfu.mapper.BoardFileMapper;
import com.example.mfu.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    private BoardFileMapper boardFileMapper;

    private final String uploadDir = "C:/project/upload/";

    public void addBoard(BoardForm boardForm) {
        // 1. 게시글 정보 저장
        Board board = new Board();
        board.setBoardTitle(boardForm.getBoardTitle());
        Integer addBoardRow = boardMapper.insertBoard(board);
        if (addBoardRow == null || addBoardRow != 1) {
            throw new AddBoardException("board 입력 실패");
        }

        log.info("생성된 boardNo: {}", board.getBoardNo());

        if (addBoardRow != 1) {
            throw new AddBoardException("게시글 저장 실패");
        }
        
        // 2. 파일 업로드 처리
        List<MultipartFile> fileList = boardForm.getBoardFile();
        if (fileList != null && !fileList.isEmpty()) {
            for (MultipartFile file : fileList) {
                if (file.isEmpty()) continue;

                String originalName = file.getOriginalFilename();
                String ext = originalName.substring(originalName.lastIndexOf("."));
                String uuidName = UUID.randomUUID().toString().replace("-", "") + ext;

                BoardFile boardFile = new BoardFile();
                boardFile.setBoardNo(board.getBoardNo());
                boardFile.setFileType(file.getContentType());
                boardFile.setFileName(uuidName);

                int fileRow = boardFileMapper.insertBoardFile(boardFile);
                if (fileRow != 1) {
                    throw new AddBoardException("파일 메타데이터 저장 실패");
                }

                File destFile = new File(uploadDir + uuidName);
                try {
                    file.transferTo(destFile);
                } catch (IOException e) {
                    log.error("파일 저장 중 오류", e);
                    throw new AddBoardException("파일 저장 실패");
                }
            }
        }
        log.info("BoardForm Title: {}", boardForm.getBoardTitle());
        log.info("InsertBoard result: {}", addBoardRow);
        log.info("Generated boardNo: {}", board.getBoardNo());
    }
    //boardList  
    public List<Board> getBoardList() {
        return boardMapper.selectBoardList();
    }
    //boardOne
    public Board getBoardOne(int boardNo) {
        return boardMapper.selectBoardOne(boardNo);
    }

    public List<BoardFile> getBoardFileList(int boardNo) {
        return boardFileMapper.selectBoardFileList(boardNo);
    }
    public void updateBoard(Board board) {
        boardMapper.updateBoard(board);
    }

    public void deleteBoard(int boardNo) {
    	boardMapper.deleteBoardFiles(boardNo);
        boardMapper.deleteBoard(boardNo);
    }

}
