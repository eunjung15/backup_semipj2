package com.ez.herb.board.model;

import java.util.List;

import com.ez.herb.common.SearchVO;

public interface BoardService {
	int insertBoard(BoardVO vo);
	List<BoardVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int updateReadCount(int no);
	BoardVO selectByNo(int no);
	boolean checkPwd(int no, String pwd);
	int updateBoard(BoardVO vo);
	int deleteBoard(int no);
}
