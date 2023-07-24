package com.ez.herb.board.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.herb.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{	
	//DI - 생성자에 의한 주입
	private final BoardDAO boardDao;

	/*
	@Autowired
	public BoardServiceImpl(BoardDAO boardDao) {
		this.boardDao=boardDao;
	}*/
	
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}

	@Override
	public List<BoardVO> selectAll(SearchVO searchVo) {
		return boardDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return boardDao.getTotalRecord(searchVo);
	}

	@Override
	public int updateReadCount(int no) {
		return boardDao.updateReadCount(no);
	}

	@Override
	public BoardVO selectByNo(int no) {
		return boardDao.selectByNo(no);
	}

	@Override
	public boolean checkPwd(int no, String pwd) {
		String dbPwd=boardDao.selectPwd(no);
		
		boolean result=false;
		if(dbPwd.equals(pwd)) {
			result=true;  //비밀번호 일치
		}
		
		return result;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int no) {
		return boardDao.deleteBoard(no);
	}

	
}








