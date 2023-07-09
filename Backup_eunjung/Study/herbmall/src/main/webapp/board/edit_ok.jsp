<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.board.model.BoardVO"%>
<%@page import="com.herbmall.board.model.BoardDAO"%>
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
	//write.jsp에서 [수정]버튼을 클릭하면 post방식으로 submit됨
	
	//1
	request.setCharacterEncoding("utf-8");
   
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	
	//2
	BoardDAO boardDao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setNo(Integer.parseInt(no));
	vo.setTitle(title);
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setContent(content);
	
	try {
	   	int cnt = boardDao.updateBoard(vo);
	
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글 수정되었습니다.");
				location.href="detail.jsp?no=<%=no%>";
			</script>	
	<%	}else{%>
			<script type="text/javascript">
				alert("글 수정 실패!");
				history.go(-1);
			</script>				
	<%	}
	} catch (SQLException e) {
	   	e.printStackTrace();
	}
	
%>
</body>
</html>



