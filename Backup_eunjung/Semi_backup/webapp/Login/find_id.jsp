<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>아이디찾기</title>
<head>
<script type="text/javascript">

	function id_search() { 
	 	var frm = document.idfindscreen;
	
	 	if (frm.member_name.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }
	
		/*  if (frm.member_phone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 } */
	
		 frm.method = "post";
		 frm.action = "findIdResult.jsp"; //넘어간화면
		 frm.submit();  
		 }
		
	
</script>
</head>
<style>
idfindscreen {
    display: block;
    position: absolute;
    z-index: 9000;
    left: 100px;
    top:100px;
    background-color: #000;
}
</style>

<body>

<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>이름 및 휴대폰 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="member_name" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" onKeyup = "addHypen(this);" name="member_phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 	<div id="mask"></div>
 </form>

</body>
</html>
