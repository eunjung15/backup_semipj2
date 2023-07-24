package com.ez.herb.reboard.model;

import java.util.List;
import java.util.Map;

import com.ez.herb.common.SearchVO;

public interface ReBoardService {
	int insertReBoard(ReBoardVO vo);
	List<ReBoardVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int updateReadCount(int no);
	ReBoardVO selectByNo(int no);
	boolean checkPwd(int no, String pwd);
	int updateReBoard(ReBoardVO vo);
	void deleteReBoard(Map<String, String> map);
	int updateDowncount(int no);
	int reply(ReBoardVO vo);
}
