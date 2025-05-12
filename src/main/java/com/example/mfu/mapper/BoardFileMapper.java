package com.example.mfu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mfu.dto.BoardFile;

@Mapper
public interface BoardFileMapper {
	Integer insertBoardFile(BoardFile boardFile);
	List<BoardFile> selectBoardFileList(int boardNo);
	void deleteFile(int boardFileNo);

}

