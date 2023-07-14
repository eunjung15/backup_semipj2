<%@page import="java.sql.SQLException"%>
<%@page import="com.review.model.reviewService"%>
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
	String reviewNo = request.getParameter("reviewNo");
	
	if(reviewNo==null || reviewNo.isEmpty()){%>
		<script type="text/javascript">
	   alert("잘못된 url입니다.");
	   location.href = "history.back()";
	</script>
		<%}
	String fileName = request.getParameter("fileName");
	
	reviewService reviewSer = new reviewService();
	
	try{
		int cnt = reviewSer.deleteReview(Integer.parseInt(reviewNo));
		
		if(cnt>0){%>
		<script type="text/javascript">
	       alert('삭제 성공!');
	       location.href='reviewList_byAccNo.jsp';
	    </script>
		<%}else{ %>
		<script type="text/javascript">
	       alert('삭제 실패...');
	       history.back();
	    </script>
	
		<%}
	}catch(SQLException e){
	 e.printStackTrace();
	}
%>
</body>
</html>