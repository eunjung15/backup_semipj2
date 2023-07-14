<%@page import="com.member.model.MemberService"%>
<%@page import="com.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Login/loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.member.model.MemberService" scope="session"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");

	String accno=request.getParameter("accno");
   String id=(String)session.getAttribute("id");
   String pwd=request.getParameter("pwd");
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String tel=request.getParameter("tel");
   String card=request.getParameter("card");
   
   
   MemberVO memVo = new MemberVO();
   memVo.setAccno(Integer.parseInt(accno));
   memVo.setId(id);
   memVo.setPwd(pwd);
   memVo.setName(name);
   memVo.setEmail(email);
   memVo.setTel(tel);
   memVo.setCard(card);
   
   String msg="수정 실패",url="memberEdit.jsp";
   try{
	   int result=memService.checkLogin(id, pwd);
	   
	   if(result==MemberService.LOGIN_OK){
	      int cnt=memService.updateMember(memVo);
	      
	      if(cnt>0){
	         msg="회원정보가 수정되었습니다.";
	      }
	   }else if(result==MemberService.DISAGREE_PWD){
	      msg="비밀번호가 틀렸습니다.";
	   }
   }catch(SQLException e){
	   e.printStackTrace();
   }
   
   request.setAttribute("msg", msg);
   request.setAttribute("url", url);
   
%>
<jsp:forward page="../inc/message.jsp"></jsp:forward>

</body>
</html>