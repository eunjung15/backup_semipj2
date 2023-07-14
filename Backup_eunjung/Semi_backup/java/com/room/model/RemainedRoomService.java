package com.room.model;

import java.sql.SQLException;

public class RemainedRoomService {
	private RemainedRoomDAO remainedRoomDao;
	
	public RemainedRoomService() {
		remainedRoomDao= new RemainedRoomDAO();
	}
	
	public RemainedRoomVO checkRemainedRoom(int typeno, String checkIn, String checkOut) throws SQLException {
		return remainedRoomDao.checkRemainedRoom(typeno, checkIn, checkOut);
	}
	

}
