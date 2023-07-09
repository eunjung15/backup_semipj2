<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="boardService" class="com.herbmall.board.model.BoardService" scope="session"></jsp:useBean>
<%
	//1
	//2
	List<BoardVO> list = null;
	try {
	   list = boardService.mainNotice();
	} catch (SQLException e) {
	   e.printStackTrace();
	}
   
   //3
%>
<meta charset="UTF-8">
<title>mainNotice.jsp</title>
<style type="text/css">
		.divNotice{
			width:310px
		}
		.divNotice div table{
			width:300px
		}
		.divNotice div span{
			padding:0 0 0 160px;
		}
		.divNotice div .img1{
			width:310px;height:6px
		}
</style>
</head>
<body>
<div class="divNotice">
	<div>
		<img src="<%=request.getContextPath() %>/images/notice2.JPG" alt="공지사항">		
		<span>
			<a href="<%=request.getContextPath()%>/notice/list.jsp">
				<img src="<%=request.getContextPath() %>/images/more.JPG" 
						border="0" alt="more - 더보기">
			</a>
		</span>
	</div>
	<div>
		<img src ="<%=request.getContextPath() %>/images/Line.JPG" alt="" class="img1">
	</div>
	<div>
		<table summary="최근 공지사항 6건을 보여주는 표입니다.">
			<tbody>
				<%if(list==null || list.isEmpty()){ %>
		               <tr><td>공지사항 없음</td></tr>
		        <%}else{%>
		            <%for(int i=0; i<list.size(); i++){
		               BoardVO vo = list.get(i);%>
		               <tr>
		                  <td>
		                  <img src="<%=request.getContextPath()%>/images/dot.JPG">
		                  <a href
		         ="<%=request.getContextPath()%>/board/detail.jsp?no=<%=vo.getNo()%>">
                  <%-- <%=request.getContextPath()%> 절대참조하는 이유  include 파일은 include한 위치에 따라 경로가 바뀔 수 있어서  --%>
		                     <%=vo.getTitle()%></a>
		                  </td>
		               </tr>
		            <%} %>
		        <%}%>
					
			</tbody>
		</table>
	</div>

</div>
</body>
</html>