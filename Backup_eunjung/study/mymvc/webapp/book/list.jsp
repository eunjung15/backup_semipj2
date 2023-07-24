<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>책 리스트</h1>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>가격</th>
		<th>출판사</th>
		<th>등록일</th>
	</tr>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4">데이터가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty list }">
		<!-- 반복 시작 -->
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.no}</td>
				<td><a href="<c:url value='/book/bookDetail.do?no=${dto.no}' />">${dto.title}</a></td>
				<td><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</td>
				<td>${dto.publisher}</td>
				<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy년 MM월 dd일"/></td>
			</tr>
		<!-- 반복 끝 -->
		</c:forEach>
	</c:if>
</table>
<a href="<c:url value='/book/bookWrite.do' />">책 등록</a>
</body>
</html>