package com.herbmall.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boarDao;

	public BoardService(){
		boarDao = new BoardDAO();
	}

	public List<BoardVO>  mainNotice() throws SQLException {
		return boarDao.mainNotice();
	}

}
