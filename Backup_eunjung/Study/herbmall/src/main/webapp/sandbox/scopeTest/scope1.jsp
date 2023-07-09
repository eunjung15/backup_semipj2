<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="countVo" class="com.herbmall.test.CounterVO" scope="page"></jsp:useBean>
														 <!-- scope="page" => page에서만 유지됨 -->
	<jsp:setProperty property="count" name="countVo"/>

	<h2>scope1.jsp</h2>
	count : <jsp:getProperty property="count" name="countVo"/>
	<br>
	<a href="result1.jsp">result1.jsp</a>
		<!-- page scope 이라 여기서만 적용? -->
		
	
</body>
</html>