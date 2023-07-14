<%@page import="com.reservation.model.reservationVO"%>
<%@page import="com.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../inc/loginCheck.jsp" %>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reservationService" class="com.reservation.model.reservationService" scope="session"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");

   String reCode=request.getParameter("reCode");
   
   
   String msg="예약 취소 실패", url="resverOut.jsp";
   try{
      int result=reservationService.deleteReservation(Integer.parseInt(reCode));
         
      if(result==MemberService.LOGIN_OK){         
         int cnt=reservationService.deleteReservation(Integer.parseInt(reCode));
         
         if(cnt>0){
            msg="예약 취소가 완료되었습니다.";
            url="request.getContextPath()/mypage/profile.jsp";
            
            //세션 초기화
            session.invalidate();
            
         }
      }else if(result==MemberService.DISAGREE_PWD){
         msg="비밀번호가 틀렸습니다.";
      }else if(result==MemberService.NONE_ID){
    	  url="profile.jsp";
      }
    	  
   }catch(SQLException e){
      e.printStackTrace();
   }
   
   request.setAttribute("msg", msg);
   request.setAttribute("url", url);
   
%>
<jsp:forward page="<%=request.getContextPath() %>/mypage/profile.jsp"></jsp:forward>

</body>
</html>