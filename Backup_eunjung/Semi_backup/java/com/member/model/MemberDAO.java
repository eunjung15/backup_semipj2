package com.member.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;

	public MemberDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	/**
	 * 로그인
	 * @param userid
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int checkLogin(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3.
			String sql="select pwd from member where id=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
			}else {
				result=MemberService.NONE_ID;//해당 아이디가 없다
			}
			System.out.println("로그인 처리 결과, result="+result+", "
					+ "매개변수 userid=" + id+", pwd="+pwd);

			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 관리자 로그인
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int AdminLogin(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			//1,2
			con=pool.getConnection();

			//3.
			String sql="SELECT adminpwd FROM admin WHERE adminid = ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
				System.out.println("로그인 처리 결과, result="+result+", 매개변수 adminid=" + id+", adminpwd="+pwd);
			}
				return result;
			}finally {
				pool.dbClose(rs, ps, con);
			}

		
	}
	
	/**
	 * 회원가입
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			////////////////////////
			String sql = "insert into member(accno, id,name,pwd,age,email,tel,card)"
					+ " values(member_seq.nextval, ?, ?, ?, ?, ?, ?,?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getAge());
			ps.setString(5, vo.getEmail());
			ps.setString(6, vo.getTel());
			ps.setString(7, vo.getCard());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("member 등록 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 아이디 중복확인용 메서드
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int duplicateId(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select count(*) from member where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;

			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {  //이미 존재-> 사용불가
					result=MemberService.UNUSABLE_ID;
				}else { //해당 아이디는 없다 - 사용가능
					result=MemberService.USABLE_ID;					
				}
			}
			System.out.println("아이디 중복확인 결과, result="+result
					+", 매개변수 userid="+id);

			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	
/**
 * 회원정보출력
 * @param id
 * @return
 * @throws SQLException
 */
	public MemberVO selectMember(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		MemberVO vo = new MemberVO();
		try {
			con = pool.getConnection();

			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {            
				 int accno = rs.getInt("accno");
		         String pwd = rs.getString("pwd");
		         String name = rs.getString("name");
		         String email = rs.getString("email");
		         String tel = rs.getString("tel");
		         String card = rs.getString("card");

		         vo.setAccno(accno);
		         vo.setPwd(pwd);
		         vo.setName(name);
		         vo.setEmail(email);
		         vo.setTel(tel); 
		         vo.setCard(card); 
			}
			System.out.println("회원정보 검색결과: " + vo + ", 매개변수 id: " + id);

			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 회원정보출력
	 * @param accNo
	 * @return
	 * @throws SQLException
	 */
		public MemberVO selectMember(int accNo) throws SQLException {
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			MemberVO vo = new MemberVO();
			try {
				con = pool.getConnection();

				String sql = "select * from member where accNo = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, accNo);

				rs = ps.executeQuery();
				if(rs.next()) {            
					String name = rs.getString("name");
					String pwd = rs.getString("pwd");
					String age = rs.getString("age");
					String email = rs.getString("email");
					String tel = rs.getString("tel");

					vo.setName(name);
					vo.setPwd(pwd);
					vo.setAge(age);
					vo.setEmail(email);
					vo.setTel(tel); 
				}
				System.out.println("회원정보 검색결과: " + vo + ", 매개변수 accNo: " + accNo);

				return vo;
			} finally {
				pool.dbClose(rs, ps, con);
			}
		}

	/**
	 * 회원정보수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;

		try {
			con=pool.getConnection();

			String sql="update member"
					+ " set id=?, pwd=?, name=?, email=?, tel=?, card=?"
					+ " where id=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getTel());
			ps.setString(7, vo.getCard());

			int cnt=ps.executeUpdate();

			System.out.println("회원 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 회원탈퇴
	 * @param userid
	 * @return
	 * @throws SQLException
	 */
	public int withdrawMember(String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;

		try {
			con=pool.getConnection();

			String sql="update member set outdate=sysdate where pwd=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, pwd);

			int cnt=ps.executeUpdate();

			System.out.println("회원 탈퇴 결과 cnt="+cnt+", 매개변수 id="+pwd);
			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}

	}
	
	/**
	 * 아이디 찾기
	 * @param member_name
	 * @param member_phone
	 * @return
	 */
	public String findId(String name, String tel) {
		String mid = null;
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try {
			String sql = "select id from members "
					+ "where name=? and tel=? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, tel);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("id");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	/**
	 * 비밀번호찾기
	 * @param id
	 * @param tel
	 * @return
	 */
	public String findpwd(String id, String tel) {
		String mid = null;
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try {
			String sql = "select pwd from members "
					+ "where id=? and tel=? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, tel);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("pwd");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	public List<MemberVO> showAllMember(String keyword, String condition) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MemberVO> list = new ArrayList<>();
		
		con = pool.getConnection();
		
		try {
			String sql = "SELECT * FROM MEMBER ";
			if(keyword!=null && !keyword.isEmpty()) {
				sql += " WHERE " + condition + " LIKE '%' || ? || '%'";
			}
			sql += " ORDER BY REGDATE DESC";
			ps = con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1,  keyword);
			}
			
			rs=ps.executeQuery();
			while(rs.next()) {
				
				
				int accNo = rs.getInt("accno");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String age = rs.getString("age");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				Timestamp regdate = rs.getTimestamp("regdate");
				Timestamp outdate = rs.getTimestamp("outdate");
				String card = rs.getString("card");
				
				MemberVO vo = new MemberVO(accNo, id, name, pwd, age, email, tel, regdate, outdate, card);
				
				list.add(vo);
				System.out.println("조회 회원 결과, list.size = " + list.size() + ", 매개변수 keyword = " + keyword + ", condition = " + condition);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}














