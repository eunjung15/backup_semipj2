<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
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
   //http://localhost:9090/mystudy/pd/delete.jsp?no=8
   // pdDetail.jsp 에서 [삭제]눌러서 get 방식으로 이동
   //1 요청 파라미터 읽어오기(인코딩)
   String no = request.getParameter("no");
	
	//번호 없을 경우 error //주소값으로 들어 왔을 경우
	if(no==null || no.isEmpty()){%>
	<script type="text/javascript">
	   alert("잘못된 url 입니다!");
	   location.href="pdList.jsp";
	</script>
	
	<%   return;
	}

   //2 db작업
   PdDAO pdDao = new PdDAO();

   try {
      int cnt = pdDao.delete(Integer.parseInt(no));

      //3 결과처리
      if (cnt > 0) {
         response.sendRedirect("list.jsp");
      } else {
         out.print("삭제 실패!");
      }
   } catch (SQLException e) {
      e.printStackTrace();
   }
%>
</body>
</html>