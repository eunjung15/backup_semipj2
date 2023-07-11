<%@page import="com.member.model.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../mainpage/mainTop.jsp"  %>

<style>
		div#wrap_profile {
			padding: 2rem;
			margin: 0 auto;
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 900px;
			scale: 0.85;
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
		body {
		  overflow-x: hidden; /* Hide horizontal scrollbar */
		  overflow-y: scroll; /* Show vertical scrollbar */
		}
</style>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
	function check(){
		if(document.fr.pwd.value == ""){
			alert("비밀번호를 입력하세요!");
			documet.fr.pass.focus();
			return false;
		}
	}
</script>
<jsp:useBean id="memService" class="com.member.model.MemberService"
	scope="session"></jsp:useBean>
	
<%
		//1
		String id = (String) session.getAttribute("id");
		
		if(id == null){
			response.sendRedirect("login.jsp");
		}
		//2
		MemberDAO dao = new MemberDAO();
		MemberVO vo = null;
		try {
			vo = memService.selectMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3
		String pwd = vo.getPwd();
		String name = vo.getName();
		String card = vo.getCard();
		String email = vo.getEmail();
		String tel = vo.getTel();
%>

<selection id="profile"> <!-- 상단 띠 이미지 영역--> <!-- <div id="topImg" class="top_Img">
		<img alt="로고 이미지" src="../image/logo.png" />
	</div> -->
<body>
<div id="wrap_profile">

	<!-- 라인 이미지 영역-->
	<div id="topLine" class="top_Line">
		<img class="d-block mx-auto mb-4" src="../images/profile.png" alt=""
			width="100" height="100"> &nbsp;
	</div>

	<!-- infor -->
	<div id="infor">
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

				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<body>
							<!-- 상단 띠 이미지 영역-->

							<!-- infor -->
							<div id="register">
								<form class="row g-3">
									<div class="col-md-6">
										<label for="inputEmail4" class="form-label">아이디</label> <input
											type="email" class="form-control" id="id"
											placeholder="<%=vo.getId()%>">
									</div>
									<div class="col-md-6">
										<label for="inputPassword4" class="form-label">비밀번호</label> <input
											type="password" class="form-control" id="inputPassword4"
											placeholder="<%=vo.getPwd()%>">
									</div>
									<div class="col-12">
										<label for="inputAddress" class="name">이름</label> <input
											type="text" class="form-control" id="name"
											placeholder="<%=vo.getName()%>">
									</div>
									<div class="col-12">
										<label for="inputAddress2" class="email">이메일</label> <input
											type="text" class="form-control" id="email"
											placeholder="<%=vo.getEmail()%>">
									</div>


									<div class="col-md-6">
										<label for="tel" class="form-label">연락처</label> <input
											type="text" class="form-control" id="tel"
											placeholder="<%=vo.getTel()%>">
									</div>

									<div class="col-md-6">
										<label for="card" class="form-label"> Credit card
											number </label> <input type="text" class="form-control" id="card"
											placeholder="<%=vo.getTel()%>">
									</div>

									<div class="col-13 d-flex justify-content-center">
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
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<strong>This is the second item's accordion body.</strong> It is
								hidden by default, until the collapse plugin adds the
								appropriate classes that we use to style each element. These
								classes control the overall appearance, as well as the showing
								and hiding via CSS transitions. You can modify any of this with
								custom CSS or overriding our default variables. It's also worth
								noting that just about any HTML can go within the
								<code>.accordion-body</code>
								, though the transition does limit overflow.
							</div>
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
								<strong>⚠️약관에 동의하시면 계정 삭제가 진행됩니다.</strong>&nbsp;
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
									<a href="memberOut.jsp" onclick="window.open('memberOut.jsp','tistory','width=200, height=200, left=Math.floor((window.innerWidth - 200) / 2), top=Math.floor((window.innerHeight - 200) / 2))">
									<button type="button" class="btn btn-primary">
									회원탈퇴</button></a>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- wrap -->
		</div></div>
</body>
</selection>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

