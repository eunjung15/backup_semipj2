<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span><%=vo.getTitle() %></span></div>
		<div><span class="sp1">작성자</span> <span><%=vo.getName() %></span></div>
                  ....코드 생략 
		<div class="center">
			<a href='edit.jsp?no=<%=no%>'>수정</a> |
        	                  <a href='delete.jsp?no=<%=no%>'>삭제</a> |
        	                  <a href='list.jsp'>목록</a>			
		</div>
	</div>

	<jsp:include page="../comment/commentList.jsp"/>

</body>
</html>