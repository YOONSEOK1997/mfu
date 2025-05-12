package com.example.mfu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mfu.dto.Board;
import com.example.mfu.dto.BoardFile;
import com.example.mfu.dto.BoardForm;
import com.example.mfu.service.BoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@GetMapping({"/addBoard"})
	public String addBoard() {
		return "addBoard";
	}
	@PostMapping("/addBoard")
	public String addBoard(BoardForm boardForm) {
		log.info(boardForm.toString());
		boardService.addBoard(boardForm);
		return "redirect:/";


	}
	@GetMapping({"/","/boardList"})
	public String getBoardList(Model model) {
		List<Board> boardList = boardService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "boardList"; 
	}
	@GetMapping("/boardOne")
	public String getBoardOne(@RequestParam int boardNo, Model model) {
		Board board = boardService.getBoardOne(boardNo);
		List<BoardFile> fileList = boardService.getBoardFileList(boardNo);
		model.addAttribute("board", board);
		model.addAttribute("fileList", fileList);
		return "boardOne";
	}
	@GetMapping("/updateBoard")
	public String updateBoardForm(@RequestParam int boardNo, Model model) {
		Board board = boardService.getBoardOne(boardNo);
		model.addAttribute("board", board);
		return "updateBoard"; 
	}

	@PostMapping("/updateBoard")
	public String updateBoard(Board board) {
		boardService.updateBoard(board);
		return "redirect:/boardOne?boardNo=" + board.getBoardNo();
	}
	//파일 삭제 
	@PostMapping("/deleteFile")
	public String deleteFile(@RequestParam int boardFileNo,
			@RequestParam int boardNo) {
		boardService.deleteFile(boardFileNo);
		log.info("파일삭제");
		log.info("삭제할 파일번호: {}", boardFileNo);
		return "redirect:/boardOne?boardNo=" + boardNo;
		
	}
	@PostMapping("/deleteBoard")
	public String deleteBoard(@RequestParam int boardNo) {
		boardService.deleteBoard(boardNo);
	
		return "redirect:/";
	}


}


