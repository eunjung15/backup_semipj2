package com.ez.herb.reboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.herb.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReBoardServiceImpl implements ReBoardService{	
	//DI - 생성자에 의한 주입
	private final ReBoardDAO reBoardDao;

	/*
	@Autowired
	public ReBoardServiceImpl(ReBoardDAO reBoardDao) {
		this.reBoardDao=reBoardDao;
	}*/
	
	public int insertReBoard(ReBoardVO vo) {
		return reBoardDao.insertReBoard(vo);
	}

	@Override
	public List<ReBoardVO> selectAll(SearchVO searchVo) {
		return reBoardDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return reBoardDao.getTotalRecord(searchVo);
	}

	@Override
	public int updateReadCount(int no) {
		return reBoardDao.updateReadCount(no);
	}

	@Override
	public ReBoardVO selectByNo(int no) {
		return reBoardDao.selectByNo(no);
	}

	@Override
	public boolean checkPwd(int no, String pwd) {
		String dbPwd=reBoardDao.selectPwd(no);
		
		boolean result=false;
		if(dbPwd.equals(pwd)) {
			result=true;  //비밀번호 일치
		}
		
		return result;
	}

	@Override
	public int updateReBoard(ReBoardVO vo) {
		return reBoardDao.updateReBoard(vo);
	}

	@Override
	public void deleteReBoard(Map<String, String> map) {
		reBoardDao.deleteReBoard(map);
	}

	@Override
	public int updateDowncount(int no) {
		return reBoardDao.updateDowncount(no);
	}

	@Override
	@Transactional
	public int reply(ReBoardVO vo) {
		int cnt=reBoardDao.updateSortNo(vo);
		cnt=reBoardDao.insertReply(vo);
		
		return cnt;
	}

	
}








