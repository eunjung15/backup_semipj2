<%@page import="com.pd.model.PdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdEdit.jsp</title>
</head>
<body>
<%
	//
	//pdDetail.jsp에서 [수정]링크 클릭하면 get방식으로 이동	
	String no = request.getParameter("no");

	//request에서 결과값 읽어오기
	PdDTO dto=(PdDTO)request.getAttribute("dto");
	
	//3
	
%>
<h1>상품 수정</h1>
<form name="frmEdit" method="post" 
	action="<%=request.getContextPath() %>/pd/pdEdit_ok.do">
	<input type="hidden" name="no" value="<%=no%>">
	상품명 : <input type="text" name="pdName" value="<%=dto.getPdName()%>"><br>
	가격 : <input type="text" name="price" value="<%=dto.getPrice()%>"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
</form>
<br>
<a href="<%=request.getContextPath() %>/pd/pdList.do">상품 목록</a>
</body>
</html>






