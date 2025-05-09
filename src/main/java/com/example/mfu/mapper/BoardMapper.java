package com.example.mfu.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mfu.dto.Board;

@Mapper
public interface BoardMapper {
	Integer insertBoard(Board board);
	List<Board> selectBoardList();
	Board selectBoardOne(int boardNo);
	void updateBoard(Board board);
	void deleteBoardFiles(int boardNo);
	void deleteBoard(int boardNo);

	}

