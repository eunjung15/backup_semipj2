<%@page import="com.hotel.model.hotelVO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../form/header2.jsp"  %>


<style>
		 div#infor {
		 	
		    width: 800px;
		    margin: 0 auto;
		    /* transform: translate(50%, 0%); */
		    /* margin-bottom: 300px; */
		}
		 
		input#inputCity {
			width: 385px;
		}
		
		div#bt {
			padding: inherit;
			justify-content: center;
			margin-top: 20px;
		    margin-left: 280px;
		}
		
		button.btn.btn-primary {
			width: 200px;
		}
		
		svg.bi.bi-airplane-fill {
			margin: 5px;
		}
		
		svg.bi.bi-calendar-check {
			margin: 5px;
		}
		
		svg.bi.bi-person-circle {
			margin: 5px;
		}
		
		.col-md-4 {
			width: 150px;
		}
		
		form.row.g-3 {
			width: 700px;
			margin-left: 50px;
		}
		input#inputCity {
			width: 685px;
		}
		
		form.row.g-3 {
			width: 700px;
			margin-left: 15px;
		}
		
		.fixed-element {
		  position: fixed;
		  overflow-y: scroll;
		}
		.box12{
		    margin: 10px
		    width: 500px;
		    font-size: 20px;
		    line-height: 40px;
		}
		select#age {
		    margin-top: 10px;
		    margin-bottom: 10px;
		}
		
		.container{
		    scale: 0.9;
	        font-size: 15px;
		} 
		div#wrap_profile {
		    scale: 0.8;
		}
		
		button.btn.btn-primary {
		    margin-top: 20px;
		}
		.col {
		    width: 300px;
		}
		div#register {
		    width: 900px;
		}
		div#wrap_profile {
		    margin: 0 auto;
		}
</style>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	
	$(function() {
		$("#wr_submit").click(function() {			
			if ($('#pwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
		});
	    
/* 	document.addEventListener('DOMContentLoaded', function() {
	    var checkbox = document.getElementById('flexSwitchCheckDefault');
	    var button = document.querySelector('#bt button');

	    checkbox.addEventListener('change', function() {
	      if (checkbox.checked) {
	        button.disabled = false;
	      } else {
	        button.disabled = true;
	      }
	    });
	  }); */
	  
</script>

<jsp:useBean id="memService" class="com.member.model.MemberService"
	scope="session"></jsp:useBean>
	
<%

	//[1] 글쓰기 - list.jsp에서 [글쓰기]링크 클릭하면 get방식으로 이동
	//[2] 글수정 - detail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
	//=> 파라미터 no가 있는 경우는 글수정
	
	
	//1
	String id=request.getParameter("id");
	
	  /* if(id == null){
			response.sendRedirect("../Login/login.jsp");
		}  */ 
	  
	 boolean isEdit=false;
	String pageTitle="", btLabel="";
	if(id!=null && !id.isEmpty()){
		isEdit=true;  
		
		pageTitle="회원정보 수정";
		btLabel="수정";
	}else{  
		pageTitle="정보 수정 쓰기";
		btLabel="등록";		
	}	
	//2
	//수정인 경우만 db에서 데이터 조회해서 출력해준다
	MemberVO vo=new MemberVO();
			System.out.println("====");
	if(isEdit){
		MemberDAO memberDAO = new MemberDAO();
		try{
			vo=memberDAO.selectMember(id);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	int accno = vo.getAccno();
	String pwd = vo.getPwd();
	String name = vo.getName();
	String email = vo.getEmail();
	String tel = vo.getTel();
	String card = vo.getCard();
	
	
	session.setAttribute("accno", accno);
	/* 
	if(id==null) id="";
	if(pwd==null) pwd="";
	if(name==null) name="";
	if(email==null) email="";
	if(card==null) card="";
	if(tel==null) tel=""; */


%>

<selection id="profile"> <!-- 상단 띠 이미지 영역--> <!-- <div id="topImg" class="top_Img">
		<img alt="로고 이미지" src="../image/logo.png" />
	</div> -->
<body>
<form name="frm1" method="post" action="memberEdit_ok.jsp">
<!-- <form name="frm2" method="post" action='mylist.jsp'> -->
<div id="wrap_profile">


	<!-- infor -->
	<div id="infor">
	<!-- 라인 이미지 영역-->
	<div id="topLine" class="top_Line">
		<img class="d-block mx-auto mb-4" src="../images/profile.png" alt=""
			width="100" height="100"> &nbsp;
	</div>
		<div class="accordion" id="accordion">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">


						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-airplane-fill"
							viewBox="0 0 16 16">
							  <path
								d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Z" />
							</svg>
						여행객 정보 입력
					</button>
				</h2>

				<input type="hidden" class="form-control" id="no" value="<%=vo.getAccno()%>">
				
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<body>
							<!-- 상단 띠 이미지 영역-->

					<div class="accordion-body">
							<!-- infor -->
							<div id="register">
								<form class="row g-3">
								<div class="row">
						  <div class="col-5">
						    <label for="id" class="form-label"> 아이디</label>
						    <input type="text" class="form-control" id="id" 
						    value="<%-- <%=id %> --%>eunjung" required>

						  </div>
						
						  <div class="col-5">
						    <label for="password" class="form-label">비밀번호</label>
						    <input type="password" class="form-control" id="password" 
						    value="<%-- <%=vo.getPwd() %> --%>1234" required>
						  </div>
						</div><br>
							<div id="register">
								<form class="row g-3">
								<div class="row">
						  <div class="col-5">
						    <label for="Name" class="form-label"> 이름</label>
						    <input type="name" class="form-control" id="name" 
						    value="<%-- <%=vo.getName() %> --%>eunjung" required>

						  </div>
						
						  <div class="col-5">
						    <label for="tel" class="form-label">이메일</label>
						    <input type="email" class="form-control" id="email" 
						    value="<%-- <%=vo.getEmail() %> --%>eung@ezen.com" required>
						  </div>
						</div><br>
					<div id="register">
								<form class="row g-3">
								<div class="row">
						  <div class="col-5">
						    <label for="Name" class="form-label"> 연락처</label>
						    <input type="text" class="form-control" id="hotel" 
						    value="<%-- <%=vo.getTel() %> --%>010-0000-0000" required>

						  </div>
						
						  <div class="col-5">
						    <label for="tel" class="form-label">Credit card</label>
						    <input type="text" class="form-control" id="room" 
						    value="<%-- <%=vo.getCard()%> --%>1234-868-3335" required>
						  </div>
						</div><br>
					</div>

									<div class="col-10 d-flex justify-content-center">
										<button type="submit" class="btn btn-primary">회원정보수정</button>
									</div>
							</div>
					</div>
				</div>

				<h2 class="accordion-header" id="headingone">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar-check"
									viewBox="0 0 16 16">
							  <path
										d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
							  <path
										d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
							</svg>
								내 예약
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse" name="box222"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							 <jsp:include page="mylist.jsp" />  
						</div>
					</div>
					
					
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
							  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
							</svg>
								내 계정
							</button>
						</h2>

						<div id="collapseThree" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<div class="box12">
								<strong>⚠️약관에 동의하셔야 회원 삭제가 진행됩니다.</strong>&nbsp;
								  <select class="form-select" name="age" id="age" required>
								 <option value="option" > --- 탈퇴 사유를 선택하여 주세요 ---</option>
		                        <option>사용 빈도가 낮음.</option>
		                        <option>이벤트 및 쿠폰 혜택이 작다.</option>
		                        <option>이용방법이 어렵다.</option>
		                        <option>호텔 선택폭이 좁다.</option>
		                        <option>가격이 비싸다.</option>
		                        <option>서비스가 불만족스러움.</option>
		                        <option>기타</option>
		                        </select>
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch"
											id="flexSwitchCheckDefault" /> <label
											class="form-check-label" for="flexSwitchCheckDefault">1.
											계약 또는 청약 철회 등에 관한 기록 보존</label>
									</div>
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch"
											id="flexSwitchCheckDefault" /> <label
											class="form-check-label" for="flexSwitchCheckDefault">2.
											대금결제 및 재화 등의 공급에 보존</label>
									</div>

									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch"
											id="flexSwitchCheckDefault" /> <label
											class="form-check-label" for="flexSwitchCheckDefault">
											3. 전자금융 거래에 관한 기록 보존</label>
									</div>

									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch"
											id="flexSwitchCheckDefault" /> <label
											class="form-check-label" for="flexSwitchCheckDefault">
											4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존</label>
									</div>

									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch"
											id="flexSwitchCheckDefault" /> <label
											class="form-check-label" for="flexSwitchCheckDefault">
											5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존</label>
									</div>
								</div>
								<div id="bt">
									<a href="http://localhost:9090/testest/mypage/memberOut.jsp" >
									<button type="button" class="btn btn-primary">
									회원탈퇴</button></a>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- wrap -->
		</div></body></selection>
		</form><!-- </form> -->
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
