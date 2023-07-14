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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String accNo2 = request.getParameter("accNo");
	String hotelNo2 = request.getParameter("hotelNo");
	String booked_room_count2 = request.getParameter("qty");
	
	int accNo = Integer.parseInt(accNo2);
	int hotelNo = Integer.parseInt(hotelNo2);
	int booked_room_count = Integer.parseInt(booked_room_count2); 
	
	reservationVO reseravtionVO = new reservationVO();
	reservationService reservationService = new reservationService();
	
	reseravtionVO.setAccNo(accNo);
	reseravtionVO.setHotelNo(hotelNo);
	reseravtionVO.setBooked_room_count(booked_room_count);

	String msg = "예약 실패", url= "payment.jsp";
	try {
		int cnt = reservationService.insertReservation(reseravtionVO);

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
<jsp:forward page="message.jsp"></jsp:forward>
</body>
</html>