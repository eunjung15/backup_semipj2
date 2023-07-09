<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.book.model.BookDTO"%>
<%@page import="com.mystudy.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookWrite_ok.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String publisher = request.getParameter("publisher");
	
		BookDAO bookDao = new BookDAO();
		BookDTO dto = new BookDTO();
		dto.setTitle(title);
		dto.setPrice(Integer.parseInt(price));
		dto.setPublisher(publisher);
	
		try {
			int cnt = bookDao.insertBook(dto);
	
			if (cnt > 0) {
				 response.sendRedirect("bookList.jsp");
			} else {
				out.print("책등록 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>