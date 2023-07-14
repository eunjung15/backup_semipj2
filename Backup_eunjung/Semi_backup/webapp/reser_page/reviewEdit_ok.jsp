<%@page import="java.sql.SQLException"%>
<%@page import="com.review.model.reviewVO"%>
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
//noticeWrite.jsp에서 [등록] 버튼을 누르면 POST 방식으로 이동
	//한글 인코딩 필요
	
		//1. 요청 파라미터 입력
		request.setCharacterEncoding("utf-8");
		String reviewNo = request.getParameter("reviewNo");
		String hotelNo = request.getParameter("hotelNo");
		String accNo = request.getParameter("accNo");
		String roomType = request.getParameter("room_type");
		String score = request.getParameter("rate");
		String content = request.getParameter("content");
		
		String hotel = request.getParameter("hotel");
		
		//2. DB작업
		reviewService reviewSer = new reviewService();
		reviewVO vo = new reviewVO();
		
		vo.setScore(Integer.parseInt(score));
		vo.setContent(content);
		vo.setAccNo(Integer.parseInt(accNo));
		vo.setHotelNo(Integer.parseInt(hotelNo));
		vo.setRoom_type(roomType);
		try{
			
		int cnt = reviewSer.updateReview(vo);
		
		//3. 결과 처리
		if(cnt>0){%>
			<script type="text/javascript">
	    		alert('수정 처리되었습니다.');
	    		location.href="reviewDetail.jsp?reviewNo="+reviewNo;
	    	</script>
		<%}else{%>
			<script type="text/javascript">
	    		alert('수정 실패!');
	    		history.back();
	    	</script>
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>