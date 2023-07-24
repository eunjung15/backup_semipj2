<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
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
	<%
	String no = request.getParameter("no");
	
	BookDTO dto=(BookDTO)request.getAttribute("dto");


	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	%>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#delete').click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return;
			}else{
				location.href="<%=request.getContextPath()%>/book/bookDelete.do?no=<%=no %>";
			}
		});
	});
</script>
<h2>책 상세보기</h2>
	<input type="hidden" id="no" name="no" value="${param.no}">
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">책 제목</span> <span>${dto.title}</span>
		</div>
		<div>
			<span class="sp1">가격</span> <span><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</span>
		</div>
		<div>
			<span class="sp1">출판사</span> <span>${dto.publisher}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><fmt:formatDate value="${dto.regdate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></span>
		</div>
		<div class="center">
			<a href="<c:url value='/book/bookEdit.do?no=${param.no}'/>">수정</a> |
        	<a id="delete" href='#'>삭제</a> |
        	<a href="<c:url value='/book/bookList.do'/>">목록</a>			
		</div>
	</div>
</body>
</html>