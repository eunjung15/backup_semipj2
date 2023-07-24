package com.ez.herb.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.herb.common.SearchVO;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO vo);
	List<BoardVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int updateReadCount(int no);
	BoardVO selectByNo(int no);
	String selectPwd(int no);
	int updateBoard(BoardVO vo);
	int deleteBoard(int no);
	
}
