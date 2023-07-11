<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!DOCTYPE html>
<html lang="ko">

<head>
	<%
		String t_id=(String)session.getAttribute("id");
		boolean t_isLogin=false;
		if(t_id!=null && !t_id.isEmpty()){  //세션에 값이 있으면 로그인된 경우
			t_isLogin=true;
		}
	%>
		
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Global H.O.T.E.L Platform</title>
  <!-- 리셋 css -->
  <link rel="stylesheet" href="./common/minireset.min.css">
  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
  <!-- og -->
  <meta property="og:image" content="common/og_logo_title.png">
  <meta property ="og:type" content="website">
  <!-- 폰트 css -->
  <link rel="stylesheet" href="./font/font.css">
  <!-- indexHeader css -->
  <link rel="stylesheet" href="./css/indexHeader.css">
  <!-- index css -->
  <link rel="stylesheet" href="./css/index.css">
  <!-- header js -->
  <script defer src="./js/indexHeader.js"></script>
  <!-- index js -->
  <script defer src="./js/index.js"></script>

</head>

<style>
ul#gnb {
    margin-right: 100px;
}

body {
  font-family: "Yanolja", "Noto Sans KR", sans-serif;
  margin: 0;
  color: #000;
}
a {
  text-decoration: none;
  color: inherit;
}
h2 {
  font-size: 130px;
  text-transform: capitalize;
}
.clearfix::after {
  content: "";
  display: block;
  clear: both;
}
/* header */
.header.container {
  width: 100%;
  height: 92px;
  padding: 0 100px;
  position: fixed;
  transition: 0.25s;
  z-index: 99999;
}
header {
  display: flex;
  justify-content: space-between;
  font-size: 17px;
  padding: 25px 5px;
}

header h1 a {
  padding: 9px;
  display: block;
}
header h1 img {
  width: 5.6vw;
}
/* 메뉴 */
#gnb {
  color: black;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
  overflow: hidden;
}
#gnb img {
  width: 12px;
  height: 12px;
  opacity: 0;
}
#gnb li {
  padding-right: 4.5vw;
}
#gnb li a {
  display: block;
  padding: 9px;
}

#gnb #menubt {
    padding-right: 0;
    margin-right: 20px;
    display: flex;
    flex-direction: row-reverse;
}
#gnb #langKr {
  position: relative;
}
#gnb #langKr::after {
  content: "";
  width: 1px;
  height: 35%;
  background-color: #a2a2a2;
  position: absolute;
  top: 10px;
  right: 0;
}
#gnb #langEng {
  color: #a2a2a2;
}
/* 서브메뉴 */
#gnb .subMenu {
  position: absolute;
  opacity: 0;
  transition: 0.3s;
}
#gnb .subMenu a {
  font-size: 15.5px;
  color: #a2a2a2;
  transition: 0.3s;
}
#gnb .subMenu a:hover {
  color: #000;
  transform: translateX(5px);
}

img#logoimg {
    width: 250px;
    margin-left: 80px;
}

/* 서브메뉴 show */
.container.showMenu {
  background-color: black;
  height: 250px;
}
.container.showMenu #gnb .subMenu {
  color:black;
  opacity: 1;
}
.container.showMenu #gnb li {
  color:black;
  line-height: 1.5;
}
.container.showMenu #gnb img {
  opacity: 1;
}

li#menubt {
    margin-left: 150px;
}

</style>

<body>

  <header>
      <h1>
        <a href="../mainpage/mainTop.jsp">
        <img src="../images/logo.png" alt="이젠,갈래?_로고" id="logoimg"/></a>
      </h1>
      <ul id="gnb">
            <li><a href = "../notice/noticeList.jsp">Review</a></li>
            <li><a href = "../notice/noticeList.jsp">Announcement</a></li>
          <a href = "#">Search Hotel</a>
        <li id="menubt">
          <%if(t_isLogin){ //로그인된 경우%>
          <a href="../Login/loout.jsp" id="langEng">Logout</a>
          <a href="../mypage/profile.jsp" id="langKr">Mypage</a>
          <%}else{ %>
          <a href="../Login/login.jsp" id="langEng">Login</a>
          <a href="../signup/signup.jsp" id="langKr">Sign up</a>
          <%} %>
        
        </li>
      </ul>
    </header>
  </div> 
