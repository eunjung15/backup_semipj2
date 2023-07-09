package com.mystudy.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.db.ConnectionPoolMgr;
import com.mystudy.pd.model.PdDTO;


public class BookDAO {
	private ConnectionPoolMgr pool;
	
	public BookDAO() {
		pool = new ConnectionPoolMgr();
	}

	public int insertBook(BookDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			
			String sql = "insert into book(no, title, price, publisher, joindate)"
					+ " values(book_seq.nextval, ?, ?, ?, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getPublisher());
			
			int cnt = ps.executeUpdate();
			System.out.println("상품등록 결과, cnt = " + cnt + "매개변수 dto = " + dto);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<BookDTO> selectbookAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		//여러 개의 레코드를 List로 묶어서 리턴
		List<BookDTO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql="select * from book order by no desc";
			ps=con.prepareStatement(sql);
			
			//4.
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int No=rs.getInt(1);
				String title=rs.getString(2);
				int price=rs.getInt(3);
				String publisher=rs.getString(4);
				Timestamp joindate=rs.getTimestamp(5);
				
				//[1] 먼저 한 개의 레코드를 DTO로 묶어준다
				BookDTO dto = new BookDTO(No, title, price, publisher, joindate);
				
				//[2] 각각의 DTO를 List로 묶어서 리턴한다
				list.add(dto);
			}
			System.out.println("상품전체 조회 결과, list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public BookDTO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BookDTO dto = new BookDTO();
		try {
			con = pool.getConnection();
			
			String sql = "select * from book where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int No = rs.getInt("no");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");
				
				dto.setNo(no);
				dto.setPrice(price);
				dto.setPublisher(publisher);
				dto.setJoindate(joindate);
			}
			System.out.println("Title이름으로 검색결과: " + dto + ", 매개변수 title: " + no);
			return dto;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<BookDTO> selectAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		//여러 개의 레코드를 List로 묶어서 리턴
		List<BookDTO> list = new ArrayList<BookDTO>();
		try {
			//1,2
			con = pool.getConnection();
			
			//3.
			String sql="select * from book order by no desc";
			ps = con.prepareStatement(sql);
			
			//4.
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt(1);
				String title = rs.getString(2);
				int price = rs.getInt(3);
				String publisher = rs.getString(4);
				Timestamp joindate = rs.getTimestamp(5);	
				
				//[1] 먼저 한 개의 레코드를 DTO로 묶어준다
				BookDTO dto = new BookDTO(no, title, price, publisher, joindate);
				
				//[2] 각각의 DTO를 List로 묶어서 리턴한다.
				list.add(dto);
			}
			System.out.println("상품전체 조회 결과, list.size = " + list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateBook(BookDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "update book"
					+ "set title = ?, price = ?, publisher = ? joindate = ?"
					+ "where title = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(0, dto.getNo());
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getPublisher());
			//ps.setTimestamp(4, dto.getJoindate());
			
			int cnt = ps.executeUpdate();
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
}
