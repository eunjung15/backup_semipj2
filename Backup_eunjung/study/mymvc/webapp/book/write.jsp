<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" method="post" action="<c:url value='/book/bookWrite_ok.do'/>">
		<h1>책 등록하기</h1>
		책 제목 : <input type="text" name="bookName" /><br><br>
		가격 : <input type="text" name="price" /><br><br>
		출판사 : <input type="text" name="publisher" /><br><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>