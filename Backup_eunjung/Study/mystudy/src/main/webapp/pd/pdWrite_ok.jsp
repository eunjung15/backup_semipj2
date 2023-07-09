<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdWirte_ok.jsp</title>
</head>
<body>
<%
   //pdWrite.jsp에서 post방식으로 submit(이동)됨.
   //1. 요청 파라미터 읽어오기
   //post - 요청 파라미터(사용자 입력값)에 대한 한글 인코딩 처리
   //form 태그에서 보낸 것만 post
   request.setCharacterEncoding("utf-8");

   String pdName = request.getParameter("pdName");
   String price = request.getParameter("price");

   //2. DB작업
   PdDAO pdDao = new PdDAO();
   PdDTO dto = new PdDTO();
   dto.setPdName(pdName);
   dto.setPrice(Integer.parseInt(price));

   try {
      int cnt = pdDao.insertPd(dto);

      //3. 결과 처리
      if (cnt > 0) {
         response.sendRedirect("pdList.jsp");// response.sendRedirect: 이동 //pdList.jsp - get
      } else {
         out.print("상품등록 실패");
      }
   } catch (SQLException e) {
      e.printStackTrace();
   }
   
 %>
</body>
</html>