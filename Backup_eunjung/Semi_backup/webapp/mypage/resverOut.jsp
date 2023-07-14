<%@page import="com.reboard.model.ReBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>예약 취소</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example">
<%-- <%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/loginCheck.jsp" %> --%>

<script type="text/javascript">
   $(function(){
	   $('#inputPassword2').focus();
	   
      $('#submit').click(function(){
         if($('#inputPassword2').val().length<1){
            alert('비밀번호를 입력하세요.');
            $('#pwd').focus();
            return false;
         }
         
         if(!confirm("예약 취소를 하시겠습니까?")){
            return false;   
         }
         
      });
   });
</script>

<style>
.col-auto2 {
    margin-top: 10px;
}

input#inputPassword2 {
    width: 400px;
}

</style>
<%

ReBoardVO vo = new ReBoardVO();

%>

<article class="simpleForm">
	<form name="frmOut" method="post" action="resverOut_ok.jsp" >
		<fieldset>	
			<input type="text" value="<%=vo.getHotelno() %>" name="Hotelno" style="display:none">
				<input type="text" value="<%=vo.getRecode() %>" name="Recode" style="display:none">
			<div class="col-auto">
        <label for="inputPassword2" class="visually-hidden">Password</label>
        <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
      </div>
      <div class="col-auto2">
        <button type="submit" class="btn btn-primary mb-3">예약 취소</button>
        <button type="reset" class="btn btn-primary mb-3" onClick="history.back()">취소</button>
      </div>
      
		</fieldset>	
	</form>
</article>
    
<%-- <%@ include file="../inc/bottom.jsp" %> --%>