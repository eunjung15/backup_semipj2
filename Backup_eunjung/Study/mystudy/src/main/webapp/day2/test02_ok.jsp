<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02_ok</title>
</head>
<body>
<%
	//요청 파라미터(사용자 입력값)에 대한 한글 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//요청 파라미터 읽어오기
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String agree=request.getParameter("agree");
	
	String[] petArr=request.getParameterValues("pet");
	String pets=" ";
	if(petArr!=null){
		for(int i=0;i<petArr.length;i++){
			pets += petArr[i]+" ";
		}//for
	}
%>

<h1>요청 파라미터 값들</h1>
<p>이름 : <%=name %></p>
<p>주소 : <%=address %></p>
<p>동의여부 : <%=agree %></p>
<p>좋아하는 동물 : <%=pets %></p>

</body>
</html>