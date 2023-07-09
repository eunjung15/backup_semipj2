<%@ page language="java" contentType="text/html; 
			charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdWrite.jsp</title>
</head>
<body>
   <h1>상품 등록</h1>
   <form name = "frmWrite" method = "post" action = "pdWrite_ok.jsp">  
   										<%//action = "pdWrite_ok.jsp" 으로 SUBMIT%>
      상품명: <input type = "text" name = "pdName"><br>
      가격: <input type = "text" name = "price"><br><br>
      <input type = "submit" value = "등록">
      <input type = "reset" value = "취소">
   </form>
   <br>
   <a href = "pdList.jsp">상품 목록</a>
</body>
</html>