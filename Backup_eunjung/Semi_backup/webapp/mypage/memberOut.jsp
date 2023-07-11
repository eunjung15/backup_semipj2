<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>회원탈퇴</title>
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
         
         if(!confirm("회원탈퇴하시겠습니까?")){
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


<article class="simpleForm">
	<form name="frmOut" method="post" action="memberOut_ok.jsp" >
		<fieldset>	
			
			<div class="col-auto">
        <label for="inputPassword2" class="visually-hidden">Password</label>
        <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
      </div>
      <div class="col-auto2">
        <button type="submit" class="btn btn-primary mb-3">회원탈퇴</button>
        <button type="reset" class="btn btn-primary mb-3">취소</button>
      </div>
      
		</fieldset>	
	</form>
</article>
    
<%-- <%@ include file="../inc/bottom.jsp" %> --%>