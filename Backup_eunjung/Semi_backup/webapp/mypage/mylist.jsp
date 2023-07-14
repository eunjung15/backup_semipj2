<%@page import="com.member.model.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.reboard.model.ReBoardVO"%>
<%@page import="com.reboard.model.ReBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.reservation.model.ShowReservationDAO"%>
<%@page import="com.reservation.model.ShowReservationVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.reservation.model.reservationDAO"%>
<%@page import="com.reservation.model.reservationVO"%>
<%@page import="com.hotel.model.hotelDAO"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%-- <%@ include file="../form/header.jsp"%>  --%>    
<script type="text/javascript" src="../jquery/jquery-1.11.3.min.js"></script>
<title>reservation</title>
<script type="text/javascript">
</script>

<script type = "text/css">
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
<jsp:useBean id="ShowReservationService" class="com.reservation.model.ShowReservationService" 
	scope="session"></jsp:useBean>
    <%
  //[2] profile.jsp 에서 글목록 링크를 누르면 get방식으로 이동된다.
	
  	//1
  	request.setCharacterEncoding("utf-8");
  	String accNo=request.getParameter("accNo");
  	accNo = "1";
  	String condition=request.getParameter("searchCondition");
  	
  	//2
  	ReBoardDAO reBoardDao = new ReBoardDAO();
  	ReBoardVO vo = new ReBoardVO();
  	MemberVO vo2 =new MemberVO();
  	List<ReBoardVO> list = new ArrayList<>();
  	try{
  		list=reBoardDao.selectAll(Integer.parseInt(accNo));
  	}catch(SQLException e){
  		e.printStackTrace();
  	}
  	//3
  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  	if(accNo==null || accNo.isEmpty()){ %>
  	<script type="text/javascript">
  		alert("계획된 여행 정보가 없습니다.");
  		int hotelNo = "";
  		int reCode = "";
  		String room_type = "";
  		int booked_room_count = "";
  		int people_num = "";
  		Timestamp check_In_Date = "";
  		Timestamp check_Out_Date = "";
  		 location.href="/profile.jsp"; 
  	</script>
  	<%	return;	
  	}
  		int booked_room_count = vo.getBooked_room_count();
  		int recode = vo.getHotelno();
  		String room_type = vo.getRoom_type();
  		Timestamp check_in_date = vo.getCheck_in_date();
  		Timestamp check_out_date = vo.getCheck_out_date();
  		int hotelNo = vo.getHotelno();
  		String hotelname = vo.getHotelname();
  		
  		if (hotelname == null) {
  		    hotelname = "";
  		}
  		if (room_type == null) {
  		    room_type = "";
  		}
  		if (check_in_date == null) {
  		    check_in_date = new Timestamp(System.currentTimeMillis());
  		}
  		if (check_out_date == null) {
  		    check_out_date = new Timestamp(System.currentTimeMillis());
  		}
  	
  		/* if(hotelname==null) hotelname="";	
  		if(room_type==null) room_type="";	
  		if(check_in_date==null) check_in_date="";	
  		if(check_out_date==null) check_out_date="";	
  		if(Card==null) Card="";	
  		
  		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  		Date date = dateFormat.parse(dateString);
        String check_in_date = format.format(check_in_date);  */
        
  		//페이징 처리
  		int currentPage=1;  //현재 페이지
  		
  		if(request.getParameter("currentPage")!=null){
  			currentPage=Integer.parseInt(request.getParameter("currentPage"));
  		}
  		
  		//[1] 현재 페이지와 무관한 변수
  		int totalRecord=list.size(); //총 레코드 개수, 17
  		int pageSize=5; //한 페이지에 보여주 레코드 수
  		int blockSize=10;  //한 블럭에 보여줄 페이지 수
  		int totalPage = (int)Math.ceil((float)totalRecord/pageSize); //총 페이지 수, 4
  		
  		//[2] 현재 페이지를 이용해서 계산해야 하는 변수
  		int firstPage = currentPage - ((currentPage-1)%blockSize); //1,11,21..블럭의 시작페이지
  		int lastPage=firstPage+(blockSize-1); //10,20,30.. 블럭의 마지막 페이지
  		
  		//페이지당 ArrayList에서의 시작 index => 0,5,10,15..
  		int curPos = (currentPage-1)*pageSize;
  		
  		//페이지당 글 리스트 시작 번호
  		int num=totalRecord-curPos;
  	
%>
    
    <style>
    .btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #5D6DBE;
    --bs-btn-border-color: #5D6DBE;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #5D6DBE;
    --bs-btn-hover-border-color: #5D6DBE;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #5D6DBE;
    --bs-btn-active-bg: #5D6DBE;
    --bs-btn-active-border-color: #5D6DBE;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #5D6DBE;
    --bs-btn-disabled-bg: #5D6DBE;
    --bs-btn-disabled-border-color: #0d6efd;
	}
	
	.w-100 {
	    width: 50%!important;
	    margin-left: 120px;
	    scale: 0.8;
	}
	
	.list2 {
    float: left;
	}
    </style>
<body class="bg-light">
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="" src="../images/dateicon.png" alt="" width="72"
					height="57">
				<h2>예약정보</h2>
				<p class="lead">다가오는 조은정님의 예약 정보입니다</p>
			</div>

			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary d-flex justify-content-center">요금내역</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">100,000</h6>
							</div> <span class="text-muted">1박 가격</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-1">디럭스룸</h6>
							</div>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-1">2023/07/05 ~ 2023/07/10</h6>
							</div>
						</li>
						<li
							class="list-group-item d-flex justify-content-between bg-light">
							<div class="text-success"></div>
						</li>
						<li class="list-group-item d-flex justify-content-between"><span>Total
								(\)</span> <strong>400,000</strong></li>
					</ul>

					
				</div>


				<div class="col-md-7 col-lg-8">
					<form class="needs-validation" novalidate>
						
						<div class="row">
						  <div class="col-5">
						    <label for="Name" class="form-label"> 호텔이름</label>
						    <input type="text" class="form-control" id="hotel" 
						    placeholder="시그니엘" required>

						  </div>
						
						  <div class="col-5">
						    <label for="tel" class="form-label">객실 유형</label>
						    <input type="text" class="form-control" id="room" 
						    placeholder="싱글룸" required>
						  </div>
						</div><br>

						<div class="row">
						  <div class="col-md-5">
						    <label class="form-label">체크인 날짜</label>
						    <input type="text" class="form-control" id="day" placeholder="2023/07/05" required>
						  </div>
						  <div class="col-md-5">
						    <label for="cc-name" class="form-label">체크아웃 날짜</label>
						    <input type="text" class="form-control" id="tel" placeholder="2023/07/10" required>
						  </div>
						</div><br>
						
						<div class="row">
						  <div class="col-md-5">
						    <label for="cc-name" class="form-label">카드</label>
						    <input type="text" class="form-control" id="tel" placeholder="1546-156-4595" required>
						  </div>
						</div>
		</form>
						<br>
						<form name="frmOut" method="post" action="resverOut.jsp" >
						<button class="w-100 btn btn-primary btn-lg" type="submit" >예약취소하기</button>
		</form>			<!-- </form> -->
						
						<a href="list2.jsp"><label class="list2">지난 여행 목록</label></a>
				</div>
			</div>
		</main>

		<br>
		<hr>
		<br>
		
		<footer class="pt-4 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017–2023 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="#">Privacy</a></li>
				<li class="list-inline-item"><a href="#">Terms</a></li>
				<li class="list-inline-item"><a href="#">Support</a></li>
			</ul>
		</footer>
	</div>
</body>

<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
  



<%-- 
<%@ include file="../form/bottom.jsp"%>  --%>