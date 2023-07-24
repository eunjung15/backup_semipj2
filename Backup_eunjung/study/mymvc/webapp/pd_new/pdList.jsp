<%@page import="com.pd.model.PdDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdList.jsp</title>
</head>
<body>
<%
	//[1] pdWrite.jsp에서 상품목록 링크 클릭하면 get방식으로 이동
	//[2] pdWrite_ok.jsp에서 상품등록 성공하면 get방식으로 이동
	
	//뷰페이지
	//request에서 결과를 받아와서 화면 처리
	//List<PdDTO> list =(List<PdDTO>)request.getAttribute("list");
	
	//DecimalFormat df = new DecimalFormat("#,###");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h1>상품 목록</h1>
<table border="1" style="width: 500px">
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>등록일</th>
	</tr>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4">데이터가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty list }">	
		<!-- 반복시작 -->
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.no}</td>
				<td>
					<a href="<c:url value='/pd/pdDetail.do?no=${dto.no}'/>">
						${dto.pdName}
					</a>
				</td>
				<td style="text-align: right;">
					<fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
				</td>				
				<td>
					<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/> 
				</td>
			</tr>
		</c:forEach>
		<!-- 반복끝 -->
	</c:if>
</table>
<br><br>
<a href="<c:url value='/pd/pdWrite.do'/>">상품 등록</a>

</body>
</html>












