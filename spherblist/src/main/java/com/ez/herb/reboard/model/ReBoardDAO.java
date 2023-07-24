package com.ez.herb.reboard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.herb.common.SearchVO;

@Mapper
public interface ReBoardDAO {
	int insertReBoard(ReBoardVO vo);
	List<ReBoardVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	int updateReadCount(int no);
	ReBoardVO selectByNo(int no);
	String selectPwd(int no);
	int updateReBoard(ReBoardVO vo);
	void deleteReBoard(Map<String, String> map);
	int updateDowncount(int no);	
	int updateSortNo(ReBoardVO vo);
	int insertReply(ReBoardVO vo);
	
}
