package com.reservation.model;

import java.sql.SQLException;
import java.util.List;

public class ViewRoomService {
	private ViewRoomDAO viewRoomDao;
	
	public ViewRoomService() {
		viewRoomDao = new ViewRoomDAO();
	}
	
	public List<ViewRoomVO> selectRoomList(int hotelNo) throws SQLException{
		return viewRoomDao.selectRoomList(hotelNo);
	}
	
	public ViewRoomVO selectRoom(int hotelNo) throws SQLException {
		return viewRoomDao.selectRoom(hotelNo);
	}

}
