<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	  rel="stylesheet"
	  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	  crossorigin="anonymous">
<!-- <link rel="stylesheet" href="../css/top.css"/> -->
		
		
	<%
		String t_id=(String)session.getAttribute("id");
		boolean t_isLogin=false;
		if(t_id!=null && !t_id.isEmpty()){  //세션에 값이 있으면 로그인된 경우
			t_isLogin=true;
		}
	%>
		
		
<title>let's go EZEN</title>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript"></script>

	<style>
	header {
		margin: 0 auto;
		padding: 0;
		align-content: center;
		background-color: #4857a5;
	}
	
	div#wrap_top {
    padding: 2rem;
    /* height: 145px; */
        background-color: white;
 }
 
	
	input.bt1_top {
		background: white;
		font-size: 13px;
		border-color: #4857a5;
		height: 2rem;
		padding: 0.3125rem 0.75rem;
		align-items: center;
		flex: 1 1 100%;
		border-radius: 1rem;
		font-weight: 700;
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: right;
		margin-top: 20px;
	    margin-right: 10px;
	}
	
	input.bt2_top {
		background: white;
		font-size: 13px;
		border-color: #4857a5;
		height: 2rem;
		padding: 0.3125rem 0.75rem;
		align-items: center;
		flex: 1 1 100%;
		border-radius: 1rem;
		font-weight: 700;
		text-align: center;
		box-shadow: inset 0 0 0 1px #5D6DBE;
		float: right;
		margin-top: 20px;
	}
	
	.topbt_top {
		margin-top: 65px;
		    float: right;
	}
	
	.logoimg_top {
	    vertical-align: middle;
	    height: 70px;
	    margin-bottom: 10px;
	    margin-left: 30px;
	    margin-top: 10px;
	}
	</style>


<body>
<header>
	<!-- Top page -->	
		<div id="topImg" class="top_Img">
			 <a href="http://localhost:9090/semi2/eunjung/mainpage/mainpage.jsp"><img alt="로고 이미지" src="../images/logoWhite.png" class="logoimg_top" /></a>
				<a href="http://localhost:9090/semi2/eunjung/mainpage/mainpage.jsp">
				<input type="button" value="🏛️EZEN MAIN" class="bt1_top"/></a> 
				<%if(t_isLogin){ //로그인된 경우%>
			 	<a href="http://localhost:9090/semi2/eunjung/inc/Login/login.jsp">
			 	<input type="button" value="logout" class="bt2_top"></a>
			 	<%}else{ %>
			 	<a href="http://localhost:9090/semi2/eunjung/inc/Login/login.jsp">
			 	<input type="button" value="Login" class="bt2_top"></a>
				<%} %>
		</div>
		
</header>



