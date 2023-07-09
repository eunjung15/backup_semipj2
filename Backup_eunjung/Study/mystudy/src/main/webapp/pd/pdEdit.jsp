<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
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
	//1.요청 파라미터 읽어오기
	String no = request.getParameter("no");

	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert("잘못된 url입니다!");
			location.href="pdList.jsp";
		</script>
		
	<%	return;
	}
	
	//2.db작업
	PdDAO pdDao = new PdDAO();
	PdDTO dto=null;
	try{
		dto=pdDao.selectByNo(Integer.parseInt(no));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	
%>
<h1>상품 수정</h1>
<form name="frmEdit" method="post" action="pdEdit_ok.jsp">
	<input type="hidden" name="no" value="<%=no%>">
	상품명 : <input type="text" name="pdName" value="<%=dto.getPdName()%>"><br>
	가격 : <input type="text" name="price" value="<%=dto.getPrice()%>"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
</form>
<br>
<a href="pdList.jsp">상품 목록</a>
</body>
</html>






