package com.reboard.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;
import com.reservation.model.ShowReservationVO;



public class ReBoardDAO {
	private ConnectionPoolMgr2 pool;

	public ReBoardDAO() {
		pool= new ConnectionPoolMgr2();
	}

	
	/**
	 * 글 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<ReBoardVO> selectAll(int accno) throws SQLException{
									//회원번호로 받기
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReBoardVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql = "SELECT a.accno, a.booked_room_count, a.recode,\r\n"
					+ "b.room_type,b.check_in_date,b.check_out_date,\r\n"
					+ "b.hotelno, c.hotelname\r\n"
					+ "FROM reservation a \r\n"
					+ "JOIN reservation_detail b ON a.reCode = b.reCode\r\n"
					+ "JOIN hotel c ON a.hotelNo = c.hotelNo \r\n"
					+ "WHERE a.accNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, accno);
			
			rs=ps.executeQuery();
			//4
			while(rs.next()) {
				int booked_room_count=rs.getInt("booked_room_count");
				int recode=rs.getInt("recode");
				String room_type=rs.getString("room_type");
				Timestamp check_in_date=rs.getTimestamp("check_in_date");
				Timestamp check_out_date=rs.getTimestamp("check_out_date");
				int hotelno=rs.getInt("hotelno");
				String hotelname=rs.getString("hotelname");

				ReBoardVO vo
				=new ReBoardVO(accno, booked_room_count, recode, room_type, check_in_date, check_out_date, hotelno, hotelname);

				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size="+list.size()+", 매개변수 회원번호="+accno);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}

	}
}







