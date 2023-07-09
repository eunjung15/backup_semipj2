<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="countVo" class="com.herbmall.test.CounterVO" scope="session"></jsp:useBean>
<h2>result3.jsp</h2>
<hr>
count : <jsp:getProperty property="count" name="countVo"/>
<br>
<a href="scope3.jsp">scope3.jsp</a>
<br><br>
세션 아이디 : <%=session.getId() %>


</body>
</html>





