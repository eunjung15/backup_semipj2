<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    응답문서에 대한 contentType 지정
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03.jsp</title>
</head>
<body>
<%
	//http://localhost:9090/mystudy/day2/test03.jsp?no=7&name=홍길동
	//get
	//요청 파라미터에 대한 한글 인코딩은 server.xml에서 한번만 하면 됨
	//URIEncoding="utf-8"
	
	//1. 요청 파라미터 읽어오기
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	
%>
<h1>get-요청 파라미터 값</h1>
<p>번호 : <%=no %></p>
<p>이름 : <%=name %></p>
</body>
</html>