package com.room_detail;

import java.sql.SQLException;

public class RoomDetailService {
	private RoomDetailDAO roomDetailDao;
	
	public RoomDetailService() {
		roomDetailDao=new RoomDetailDAO();
	}
	
	public RoomDetailVO selectRoomDetail(int typeNo) throws SQLException {
		return roomDetailDao.selectRoomDetail(typeNo);
	}

}
