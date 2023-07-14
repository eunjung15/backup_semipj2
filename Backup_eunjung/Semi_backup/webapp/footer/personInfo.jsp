<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/header.jsp"%>
<style type="text/css">
.mainCookie {
	text-align: center;
}

h1 {
	margin-top: 20px;
}

.cookie1>p {
	margin: 20px 30px;
}

.cookie2>h3 {
	text-align: left;
	margin-left: 15%;
	margin-top: 30px;
	margin-bottom: 20px;
	font-weight: bold;
}

.information>p {
	margin: 20px 30px;
}

.cookie1>img {
	width: 350px;
}

.cookie3>h3 {
	text-align: left;
	margin-left: 15%;
	margin-top: 30px;
	margin-bottom: 20px;
	font-weight: bold;
}

.cookieMethod>p {
	margin: 20px 30px;
}

.cook {
	text-align: left;
	margin-left: 220px;
}

.cookie2 {
    background: #cddff8;
    border-radius: 10px;
    width: 420px;
    float: left;
    margin-left: 25px;
    margin-bottom: 11px
}

#nessCookie{
	margin-left: 180px;
}

.information {
    padding: 10px;
}

.form-check.form-switch {
    margin-left: 360px;
    margin-top: -31px;
}

input#flexSwitchCheckChecked {
    width: 40px;
    height: 25px;
}

span {
    display: inline-block;
    margin-top: 12px;
    margin-bottom: 30px;
}

.mb-5 {
    float: right;
    margin-right: 100px;
    margin-top: 20px;
}

.mb-5>input[type=button] {
    background: #4857A5;
    border: none;
    border-radius: 5px;
    color: white;
    padding: 5px 10px;
}

.change {
    clear: both;
    text-align: left;
    margin-left: 178px;
}

#foot{
	clear:both;
}
</style>
<link rel="stylesheet" href="../css/css.css">
<title>쿠키 정책</title>

<body>
	<div class="mainCookie">
		<div class="cookie_title">
			<h1>
				<img src="../images/personInfo.png" /> <strong>이젠, 갈래? 쿠키
					사용의 원칙</strong>
			</h1>
		</div>
		<br>
		<div class="cook">
			<div class="cookie1">
				<h5>
					<strong>절대 다음 목적으로 쿠키를 사용하지 않습니다.</strong>
				</h5>
				<p>▷ 고객에게 표시되는 가격 부풀리기</p>
			</div>

			<div class="cookie1">
				<h5>
					<strong>다음 목적으로 쿠키를 사용합니다.</strong>
				</h5>
				<p>▶ 사이트 이용이 더욱 용이하도록 최근 검색 기록 저장</p>
				<p>▶ 스카이스캐너 및 제3자 사이트에 관련성 높은 광고 표시</p>
				<p>▶ 고객의 사이트 이용 방식 파악</p>
			</div>
		</div>
		<div id="infobox">
			<div class="cookie2" id= "nessCookie">
				<h3>
					<strong>필수 쿠키</strong>
				</h3>
				<div class="information">
					<p>웹사이트 작동을 위한 쿠키로, 비활성화할 수 없습니다.</p>
				</div>
			</div>
			<div class="cookie2">
				<h3>
					<strong>이용 경험 향상</strong>
				</h3>
				<div class="information">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch"
							id="flexSwitchCheckChecked" checked> 
					</div>
					<span>기능테스트 개선 및 개발을 위해 사용하는 쿠키입니다.</span>
				</div>
			</div>
			<div class="cookie2">
				<h3>
					<strong>개인 맞춤 광고</strong>
				</h3>
				<div class="information">
					<p>관련성 높은 광고를 보여드립니다.</p>
				</div>
			</div>
			<div class = "change">
				<P>언제든지 설정을 변경하실 수 있습니다. <a href = "../footer/cookiePolicy.jsp">쿠키 정책</a> 보기</P>
				<p><a href = "">쿠키 확인 페이지</a>
			</div>
			<div class="mb-5">
				<input type="button" id="btn1" value="저장" onclick="location.href='../mainpage/mainpage.jsp'">
				<input type="button" id="btn2" value="취소" onclick="history.back()">
			</div>
		</div>

	</div>

	<%@include file="../form/bottom.jsp"%>
<script type=text/javascript src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('#btn1').click(function(){
			request.setCharacterEncoding("utf-8");
			
			Cookie[] cookies = request.getCookies();
			
			for(int i = 0; i<cookies.length; i++){
				String name = cookies[i].getName();
				String value = cookies[i].getValue();
				if(name.equals("abc")){
					out.println("cokies[" + i + "] name : " + name);
					out.println("<br/>");
					out.println("cokies[" + i + "] value : " + value);
					// 유효시간을 0초 설정 삭제하는 효과
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					out.println("cokies[" + i + "] name : " + name);
					out.println("<br/>");
					out.println("cokies[" + i + "] value : " + value);
		});
		
	});
</script>