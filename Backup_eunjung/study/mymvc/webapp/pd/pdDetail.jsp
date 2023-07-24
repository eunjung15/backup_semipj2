<%@page import="com.pd.model.PdDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
	//http://localhost:9090/mystudy/pd/pdDetail.jsp?no=4
	//pdList.jsp에서 [제목]클릭하면 get방식으로 이동
	
	//뷰 페이지
	//결과 받아와서 화면 처리하기
	String no = request.getParameter("no");  //view페이지에서도 request를 공유하므로 파라미터를
	//읽어올 수 있다
	
	PdDTO dto=(PdDTO)request.getAttribute("dto");

	DecimalFormat df = new DecimalFormat("#,###");
%>

<meta charset="UTF-8">
<title>pdDetail.jsp</title>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/pd/pdDelete.do?no=<%=no%>";
			}
		});
	});
</script>
</head>
<body>
	<h1>상품 상세보기</h1>
	<p>상품번호 : <%=no %></p>	
	<p>상품명 : <%=dto.getPdName() %></p>
	<p>가격 : <%=df.format(dto.getPrice()) %>원</p>
	<p>등록일 : <%=dto.getRegdate() %></p>
		
	<a href="<%=request.getContextPath() %>/pd/pdList.do">목록</a> 
	| <a href="<%=request.getContextPath() %>/pd/pdEdit.do?no=<%=no%>">수정</a> 
	| <a href="#" id="aDel">삭제</a>
</body>
</html>










