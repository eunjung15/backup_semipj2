package com.room.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.spi.DirStateFactory.Result;

import com.db.ConnectionPoolMgr2;

public class RemainedRoomDAO {
	private ConnectionPoolMgr2 pool;

	public RemainedRoomDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public RemainedRoomVO checkRemainedRoom(int typeNo, String checkIn, String checkOut) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql = "select t.*, r.remained_room, r.ask_date "
					+ "from room_type t join remained_room r "
					+ "on t.typeno=r.typeno "
					+ "where t.typeno=? and r.ask_date>=to_date(?) and r.ask_date<to_date(?)+1 "
					+ "order by r.remained_room";
			ps=con.prepareStatement(sql);
			ps.setInt(1, typeNo);
			ps.setString(2, checkIn);
			ps.setString(3, checkOut);
			
			//4.
			RemainedRoomVO vo = new RemainedRoomVO();
			rs=ps.executeQuery();
			if(rs.next()) {
				typeNo = rs.getInt(1);
				String room_type = rs.getString(2);
				int hotelNo = rs.getInt(3);
				int remained_room = rs.getInt(4);
				Timestamp ask_date = rs.getTimestamp(5);
				
				vo.setTypeno(typeNo);
				vo.setRoom_type(room_type);
				vo.setHotelNo(hotelNo);
				vo.setRemained_room(remained_room);
				vo.setAsk_date(ask_date);
			}
			
			System.out.println("잔여객실조회 결과 vo="+vo+", 매개변수 typeno="+typeNo+", checkIn="+checkIn+"checkOut="+checkOut);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
