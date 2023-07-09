<%@page import="com.mystudy.book.model.BookDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.book.model.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookList.jsp</title>
</head>
<body>
<%
			
	//1.	
	//2. db작업
	BookDAO Dao = new BookDAO();
	List<BookDTO> list=null;	
	try{
		list=Dao.selectbookAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 결과 처리
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h1>책 목록</h1>
<table border="1" style="width: 500px">
	<tr>
		<th>번호</th>
		<th>책이름</th>
		<th>가격</th>
		<th>출판사</th>
	</tr>
	
	<%
		if(list==null || list.isEmpty()){%>
			<tr>
				<td colspan="4">데이터가 없습니다.</td>
			</tr>
	<%	}else{%>
		<!-- 반복시작 -->
		<%for(int i=0;i<list.size();i++){ 
			BookDTO dto=list.get(i);
		%>
			<tr>
				<td><%=dto.getNo() %></td>
				<td>
					<a href="bookDetail.jsp?no=<%=dto.getNo() %>">
						<%=dto.getTitle() %>
					</a>
				</td>
				<td style="text-align: right;"><%=df.format(dto.getPrice()) %>원</td>
				<td><%=sdf.format(dto.getJoindate()) %></td>
			</tr>
		<%}//for %>
		<!-- 반복끝 -->
	<%}//if %>
</table>
<br><br>
<a href="bookWrite.jsp">책 등록</a>

</body>
</html>












