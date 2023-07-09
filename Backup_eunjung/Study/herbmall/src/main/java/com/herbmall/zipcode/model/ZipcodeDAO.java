package com.herbmall.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr2;

public class ZipcodeDAO {
	private ConnectionPoolMgr2 pool;
	
	public ZipcodeDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ZipcodeVO> list=new ArrayList<>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql = "select * from zipcode where dong like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1,dong);
			rs=ps.executeQuery();
			while(rs.next()) {
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				 dong = rs.getString("dong");
				String sbunji = rs.getString("startbunji");
				String ebunji = rs.getString("endbunji");
				int seq = rs.getInt("seq");
				ZipcodeVO vo = new ZipcodeVO();
				vo.setStartbunji(ebunji);
				vo.setEndbunji(ebunji);
				vo.setDong(dong);
				vo.setGugun(gugun);
				vo.setSeq(seq);
				vo.setSido(sido);
				vo.setZipcode(zipcode);
			}
			//4
			System.out.println("우편번호 조회, alist.size()=" 
					+ list.size() + ", dong=" + dong);
		} finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
	
}
