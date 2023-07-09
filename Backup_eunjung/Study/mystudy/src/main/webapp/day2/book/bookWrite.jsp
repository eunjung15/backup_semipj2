<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookWrite.jsp</title>
</head>
<body>
	<h1>상품 등록</h1>
	<form name="frmWrite" method="post" action="bookWrite_ok.jsp">
		책이름:
		<input type="text" name="title">
		<br> 가격:
		<input type="text" name="price">
		<br> 출판사:
		<input type="text" name="publisher">
		<br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	<br>
	<a href = "bookList.jsp">책 목록</a>
</body>
</html>