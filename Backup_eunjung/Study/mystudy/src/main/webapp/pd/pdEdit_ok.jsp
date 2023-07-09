<%@page import="java.io.Console"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdEdit_ok.jsp</title>
</head>
<body>
<%
	//pdEdit.jsp에서 수정버튼 클릭하면 post방식으로 서브밋됨
	//1
	request.setCharacterEncoding("utf-8");

	String no=request.getParameter("no");
	String pdName=request.getParameter("pdName");
	String price=request.getParameter("price");
	//2
	PdDAO pdDao = new PdDAO();
	PdDTO dto = new PdDTO();
	System.out.println("확인용========================");
	dto.setNo(Integer.parseInt(no));
	dto.setPrice(Integer.parseInt(price));
	dto.setPdName(pdName);
	
	try{
		int cnt=pdDao.updatePd(dto);
		
		//3
		if(cnt>0){
			response.sendRedirect("pdDetail.jsp?no=" + no);
		}else{
			out.print("수정 실패!");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>








