package com.room_detail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.db.ConnectionPoolMgr2;
import com.room.model.RemainedRoomVO;

public class RoomDetailDAO {
	private ConnectionPoolMgr2 pool;

	public RoomDetailDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public RoomDetailVO selectRoomDetail(int typeNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql = "select * from room_detail "
					+ "where typeno=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, typeNo);
			
			//4.
			RoomDetailVO vo = new RoomDetailVO();
			rs=ps.executeQuery();
			if(rs.next()) {
				int roomNo = rs.getInt("roomNo");
				int totalRoom = rs.getInt("total_room");
				int pricePerDay = rs.getInt("price_per_day");
				int bed = rs.getInt("bed");
				int wifi = rs.getInt("wifi");
				int kitchen = rs.getInt("kitchen");
				int ac = rs.getInt("ac");
				
				vo.setRoomNo(roomNo);
				vo.setTypeNo(typeNo);
				vo.setTotalRoom(totalRoom);
				vo.setPricePerDay(pricePerDay);
				vo.setBed(bed);
				vo.setWifi(wifi);
				vo.setKicthen(ac);
				vo.setAc(ac);
				
			}
			
			System.out.println("객실조회 결과 vo="+vo+", 매개변수 typeno="+typeNo);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
