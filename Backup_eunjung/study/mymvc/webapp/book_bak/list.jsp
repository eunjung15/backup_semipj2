<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1
	//2
	
	List<BookDTO> list=(List<BookDTO>)request.getAttribute("list");
	
	//3
	DecimalFormat df =new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
%>
<h1>책 리스트</h1>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>가격</th>
		<th>출판사</th>
		<th>등록일</th>
	</tr>
	
	<!-- 반복 시작 -->
	<%for(int i=0;i<list.size();i++){ 
			BookDTO dto=list.get(i);%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td><a href="<%=request.getContextPath()%>/book/bookDetail.do?no=<%=dto.getNo()%>"><%=dto.getTitle() %></a></td>
			<td><%=df.format(dto.getPrice()) %>원</td>
			<td><%=dto.getPublisher() %></td>
			<td><%=sdf.format(dto.getRegdate()) %></td>
		</tr>
	<%} %>
	<!-- 반복 끝 -->
</table>
<a href="<%=request.getContextPath()%>/book/bookWrite.do">책 등록</a>
</body>
</html>