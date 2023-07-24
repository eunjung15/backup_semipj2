<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.comments.CommentsVO"%>
<%@page import="com.comments.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    color: gray;
}

td {
    width: 100px;
}
table {
    border: 1px solid gray;
    width: 1000px;
}
td {
    border-right: 1px solid gray;
}
td.\31 {
    width: 20%;
}
td.\33 {
    width: 20%;
}

</style>

<body>
<%
CommentsDAO dao= new CommentsDAO();
CommentsVO vo=new CommentsVO();
List<CommentsVO> list=null;
try{
	list=dao.selectAll();
}catch(SQLException e){
	e.printStackTrace();
}

%>
	<table>
		<tbody>
    	<tr>
      <td class="1"><%=vo.getName() %></td>
      <td class="2"><%=vo.getContent() %></td>
      <td class="3"><%=vo.getRegdate() %></td>
    	</tr>
	  </tbody>
	  </table>
	
</body>
</html>