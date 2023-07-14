<%@page import="com.reservation_detail.model.reservation_detailVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="com.reservation.model.reservationDAO" %>
<%@ page import="com.reservation.model.reservationService" %>
<%@ page import="com.reservation.model.reservationVO" %>
<%@ page import="com.reservation_detail.model.reservation_detailDAO" %> 
<%@ page import="com.reservation_detail.model.reservation_detailService"%> 
<%@ page import="com.member.model.MemberDAO"%>
<%@ page import="com.member.model.MemberService"%>
<%@ page import="com.member.model.MemberVO"%>  
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment_ok2.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String room_type = request.getParameter("roomType");
	String people_num2 = request.getParameter("people");
	String hotelNo2 = request.getParameter("hotelNo");
		
	reservation_detailVO reseravtion_detailVO = new reservation_detailVO();
	reservation_detailService reservation_detailService = new reservation_detailService();
	
	reservation_detailVO vo = reservation_detailService.selectRecode(Integer.parseInt(hotelNo2));
	
    String checkOut = request.getParameter("checkOut");
    String checkIn = request.getParameter("checkIn");
    
    Timestamp check_In_Date = null;
    Timestamp check_Out_Date = null;
    
    
 // 날짜 형식 지정
  	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

  	try {
  	    // 문자열을 Date 객체로 변환
  	    Date checkInDate = dateFormat.parse(checkIn);
  	    Date checkOutDate = dateFormat.parse(checkOut);
		
  	    // Timestamp로 변환
  	    check_In_Date = new Timestamp(checkInDate.getTime());
  	    check_Out_Date = new Timestamp(checkOutDate.getTime());

  	} catch (Exception e) {
  	    e.printStackTrace();
  	}
	
  	int reCode = vo.getReCode();
  	int people_num = Integer.parseInt(people_num2);
  	int hotelNo = Integer.parseInt(hotelNo2);
  	
	vo.setReCode(reCode);
	vo.setPeople_num(people_num);
	
	vo.setCheck_In_Date(check_In_Date);
	vo.setCheck_Out_Date(check_Out_Date);
	vo.setHotelNo(hotelNo);
			String msg = "예약 실패", url= "payment.jsp";
	try {
		int cnt = reservation_detailService.insertReservation_detail(reseravtion_detailVO);

		//3
		if (cnt > 0) {
	msg = "예약이 완료되었습니다.";
	url = "../mypage/profile.jsp";
	
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
</body>
</html>