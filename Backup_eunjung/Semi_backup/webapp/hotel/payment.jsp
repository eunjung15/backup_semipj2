<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="com.reservation.model.reservationDAO" %>
<%@ page import="com.reservation.model.reservationService" %> 
<%@ page import="com.reservation_detail.model.reservation_detailDAO" %> 
<%@ page import="com.reservation_detail.model.reservation_detailService"%> 
<%@ page import="com.member.model.MemberDAO"%>
<%@ page import="com.member.model.MemberService"%>
<%@ page import="com.member.model.MemberVO"%>

<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<title>reservation</title>
<script type="text/javascript">
document.querySelector('.w-100 btn btn-primary btn-lg').addEventListener('click', function() {

	if() {
  		alert('결제가 완료되었습니다.');	
	} else {
		alert('결제가 취소되었습니다.')
		return false;
	}
});	
</script>
<script>
$(function()) {
	
}

</script>


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">

    
    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
    <%
    request.setCharacterEncoding("utf-8");
    reservationDAO reservationDAO = new reservationDAO();
  	reservation_detailDAO reservation_detailDAO = new reservation_detailDAO();
    MemberDAO memberDAO = new MemberDAO();
    String id = (String)session.getAttribute("id");
    MemberVO memberVO = memberDAO.selectMember(id);
   
    
    int accNo = memberVO.getAccno();
    String name = memberVO.getName();
    String userid = memberVO.getId();
    String pwd = memberVO.getPwd();
    String email = memberVO.getEmail();
    String tel = memberVO.getTel();

    String card = memberVO.getCard();
    
    String people = request.getParameter("people");
    String oneDayPrice = request.getParameter("1dayPrice");
    String hotelNo = request.getParameter("hotelNo");
    String qty = request.getParameter("qty");
  	
    int price_per_day = Integer.parseInt(oneDayPrice);
  	int people_num = Integer.parseInt(people);
  	int booked_room_count = Integer.parseInt(qty);
  	
    String roomType = request.getParameter("roomType");
  	
    String checkOut = request.getParameter("checkOut");
    String checkIn = request.getParameter("checkIn");
    
 // 날짜 형식 지정
  	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

  	int numNights2 = 0;
  	try {
  	    // 문자열을 Date 객체로 변환
  	    Date checkInDate = dateFormat.parse(checkIn);
  	    Date checkOutDate = dateFormat.parse(checkOut);
		
  	    // Timestamp로 변환
  	    Timestamp check_In_Date = new Timestamp(checkInDate.getTime());
  	    Timestamp check_Out_Date = new Timestamp(checkOutDate.getTime());
  	    
  	    // 날짜 차이 계산
  	    long durationInMillis = checkOutDate.getTime() - checkInDate.getTime();

  	    // 총 박수 계산
  	    long numNights = TimeUnit.MILLISECONDS.toDays(durationInMillis);
  	    
  	    numNights2 = (int) numNights;

  	} catch (Exception e) {
  	    e.printStackTrace();
  	}

  	
  	
  	
  	
  	
  	%>
  	
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="../images/dateicon.png" alt="결제이미지">
      <h2>결제정보</h2>
      <p class="lead">이젠,갈래 결제를 진행합니다</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">요금내역</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
          <div>
          	<h6 class="my-0">체크인</h6>
          	<span class="text-muted"><%=checkIn %></span>
          </div>
          </li>
           <li class="list-group-item d-flex justify-content-between lh-sm">
          <div>
          	<h6 class="my-0">체크아웃</h6>
          	<span class="text-muted"><%=checkOut %></span>
          </div>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">방 종류</h6>
            </div>
            <span class="text-muted"><%= roomType %></span>
            <small class="text-muted">1박가격 : <%= price_per_day %>></small>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">선택된 방의 갯수 </h6>
            </div>
            <span class="text-muted"><%= booked_room_count %> 개</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">총 인원수</h6>
            </div>
            <span class="text-muted"><%= people_num %> 명</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0"><%= numNights2 %> 박</h6>
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
            </div>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>합계 (\)</span>
            <strong><%= numNights2 * booked_room_count * price_per_day %> 원</strong>
          </li>
        </ul>

        <form class="card p-2">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </form>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원정보</h4>
        <form class="needs-validation was-validated" action ="../mypage/profile.jsp">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="Name" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" required value="<%=id%>" readonly="readonly">
              <div class="invalid-feedback">
                이름을 입력해주세요.
                
              </div>
            </div>
            
            <div class="col-12">
              <label for="ID" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="ID" placeholder="ID" required value="<%=id%>" readonly="readonly">
              <div class="invalid-feedback">
                  아이디를 입력해주세요.
                </div>
              </div>
            </div>
            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted"></span></label>
              <input type="email" class="form-control" id="email" value="<%=email%>" readonly="readonly">
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>
            <div class="col-12">
              <label for="tel" class="form-label">전화번호</label>
              <input type="text" class="form-control" id="tel" required value="<%=tel%>" readonly="readonly">
              <div class="invalid-feedback">
                전화번호를 입력해주세요.
              </div>
            </div>
              </div>
            </div>
          </div>
          <hr class="my-4">
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">정보 제공에 동의합니까?</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">다음에도 이 정보를 사용합니다.</label>
          </div>
          <hr class="my-4">
          <h4 class="mb-3">결제수단</h4>
          <div class="my-3">
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">신용카드</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">토스</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">카카오페이</label>
            </div>
          </div>
          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">소유주 이름</label>
              <input type="text" class="form-control" id="cc-name" placeholder="" required>
              <small class="text-muted">카드 소유주의 이름을 기입해주세요.</small>
              <div class="invalid-feedback">
                올바른 카드 소유주의 이름을 기입해주세요.
              </div>
            </div>
            <div class="col-md-6">
              <label for="cc-number" class="form-label">카드번호</label>
              <input type="text" class="form-control" id="cc-number" placeholder="" required>
              <div class="invalid-feedback">
               올바른 카드번호를 기입해주세요
              </div>
            </div>
            <div class="col-md-3">
              <label for="cc-expiration" class="form-label">유효기간</label>
              <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                올바른 카드 유효기간을 기입해주세요.
              </div>
            </div>
            <div class="col-md-3">
              <label for="cc-cvv" class="form-label">CVV</label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
              <div class="invalid-feedback">
                올바른 CVV 코드를 기입해주세요.
              </div>
            </div>
          </div>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="submit">결제완료</button>
          </form>
      </div>
    </div>
  </main>
  

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2023 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
  
  </body>
