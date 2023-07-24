<%@page import="com.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자유게시판 상세보기 - 허브몰</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>
	<%
		//http://localhost:9090/herbmall/board/detail.jsp?no=2
		//countUpdate.jsp에서 조회수증가 성공하면 get방식으로 이동
		
		//1
		/*
		String no=request.getParameter("no");
	   	BoardVO vo = (BoardVO)request.getAttribute("vo");

		//3
		String content = vo.getContent();
		if(content!=null){  // \r\n  => <br>
			content=content.replace("\r\n","<br>");
		}else{
			content="";
		}
		*/
	%>
	
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span>${vo.title}</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span>${vo.name}</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span>${vo.regdate}</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.readcount}</span>
		</div>
		
		<% pageContext.setAttribute("newLine", "\r\n"); %>
		<c:set var="content" value="${fn:replace(vo.content, newLine,'<br>') }"/>
		
		<div class="lastDiv">			
			<p class="content">${content}</p>
		</div>
		<div class="center">
			<a href="<c:url value='/board/edit.do?no=${param.no}'/>">수정</a> |
        	<a href="<c:url value='/board/delete.do?no=${param.no}'/>">삭제</a> |
        	<a href="<c:url value='/board/list.do'/>">목록</a>			
		</div>
	</div>

	
</body>
</html>