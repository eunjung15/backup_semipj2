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
<jsp:setProperty property="count" name="countVo"/>

<h2>scope3.jsp</h2>
count : <jsp:getProperty property="count" name="countVo"/>
<br>
<a href="result3.jsp">result3.jsp</a>
<br><br>
세션 아이디 : <%=session.getId() %>

</body>
</html>









