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
<jsp:useBean id="memService" class="com.member.model.MemberService" scope="session"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   
   String pwd=request.getParameter("pwd");
   
   String msg="회원 탈퇴 실패", url="memberOut.jsp";
   try{
      int result=memService.withdrawMember(pwd);
         
      if(result==MemberService.LOGIN_OK){         
         int cnt=memService.withdrawMember(pwd);
         
         if(cnt>0){
            msg="회원탈퇴가 완료되었습니다.";
            url="request.getContextPath()/mainpage/mainpage.jsp";
            
            //세션 초기화
            session.invalidate();
            
            //쿠키 삭제
            Cookie ck=new Cookie("ck_id",pwd);
            ck.setPath("/");
            ck.setMaxAge(0);
            response.addCookie(ck);
         }
      }else if(result==MemberService.DISAGREE_PWD){
         msg="비밀번호가 틀렸습니다.";
      }else if(result==MemberService.NONE_ID){
    	  url="../Login/login.jsp";
      }
    	  
   }catch(SQLException e){
      e.printStackTrace();
   }
   
   request.setAttribute("msg", msg);
   request.setAttribute("url", url);
   
%>
<jsp:forward page="<%=request.getContextPath() %>/signup/message.jsp"></jsp:forward>

</body>
</html>