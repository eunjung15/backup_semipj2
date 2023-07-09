<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.book.model.BookDTO"%>
<%@page import="com.mystudy.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	//http://localhost:9090/mystudy/book/bookDetail.jsp?no=4
	//bookList.jsp에서 [제목]클릭하면 get방식으로 이동
	//1.요청 파라미터 읽어오기
	String no = request.getParameter("no");

	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert("잘못된 url입니다!")
			location.href="bookList.jsp"; //->자바스크립트로 이동해라
			//jsp 먼저 인 것을 기억하기
		</script>
		
	<%	return;
	}
	//2.db작업
	BookDAO bookDao = new BookDAO();
	BookDTO dto=null;
	try{
		dto=bookDao.selectByNo(Integer.parseInt(no));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.결과 처리
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<meta charset="UTF-8">
<title>bookDetail.jsp</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="delete.jsp?no=<%=no%>";
	//jsp, jquery 섞어서 쓰지 않기//no -> string no에 있는 번호
			}
		});
	});
</script>
</head>
<body>

	<h1>상품 상세보기</h1>
	<p>책 번호 : <%=no %></p>
	<p>책 이름 : <%=dto.getTitle() %></p>
	<p>가격 : <%=df.format(dto.getPrice()) %></p>
	<p>등록일 : <%=dto.getJoindate() %></p>
	
	<a href="bookList.jsp">목록</a> | <a href="bookEdit.jsp?no=<%=no%>">수정</a>
	| <a href="#" id="aDel">삭제</a>
</body>
</html>










