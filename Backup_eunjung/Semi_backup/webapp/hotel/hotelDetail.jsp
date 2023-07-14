<%@page import="com.room_detail.RoomDetailVO"%>
<%@page import="com.room_detail.RoomDetailService"%>
<%@page import="java.awt.Image"%>
<%@page import="com.member.model.MemberVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.room.model.RemainedRoomVO"%>
<%@page import="com.reservation.model.ViewRoomDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.reservation.model.ViewRoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@include file="/form/header.jsp" %>

<%@page import="oracle.net.aso.f"%>
<%@ page import="com.review.model.reviewVO" %>
<%@page import="java.util.List"%>
<%@page import="com.hotel.model.hotelVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.facilities.model.facilitiesVO"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<link rel="stylesheet" href="../css/hotelcss.css">
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

#nav1 {
/* 	margin-top: 50px; */
	padding: 10px;
	background-color: #4857a5;
}

.icon {
	width: 20px;
	height: 20px;
}

.starIcon{
	width: 10px;
	height: 10px;
}

input[type="number"] {
  -webkit-appearance: textfield;
  -moz-appearance: textfield;
  appearance: textfield;
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
}

.number-input {
  border: 2px solid #ddd;
  display: inline-flex;
}

.number-input,
.number-input * {
  box-sizing: border-box;
}

.number-input button {
  outline:none;
  -webkit-appearance: none;
  background-color: transparent;
  border: none;
  align-items: center;
  justify-content: center;
  width: 3rem;
  height: 3rem;
  cursor: pointer;
  margin: 0;
  position: relative;
}

.number-input button:before,
.number-input button:after {
  display: inline-block;
  position: absolute;
  content: '';
  width: 1rem;
  height: 2px;
  background-color: #212121;
  transform: translate(-50%, -50%);
}
.number-input button.plus:after {
  transform: translate(-50%, -50%) rotate(90deg);
}

.number-input input[type=number] {
  font-family: sans-serif;
  max-width: 5rem;
  padding: .5rem;
  border: solid #ddd;
  border-width: 0 2px;
  font-size: 2rem;
  height: 3rem;
  font-weight: bold;
  text-align: center;
}

</style>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		  // 체크인 날짜 변경 시 이벤트 핸들러
		  $("#checkIn").on("change", function() {
		    var checkInDate = new Date($(this).val());
		    var checkOutDate = new Date($("#checkOut").val());

		    // 체크인 날짜가 체크아웃 날짜보다 미래인 경우
		    if (checkInDate > checkOutDate) {
		      // 체크인 날짜와 체크아웃 날짜를 바꿈
		      $("#checkIn").val($("#checkOut").val());
		      $("#checkOut").val($(this).val());
		    }
		    
		  });

		  // 체크아웃 날짜 변경 시 이벤트 핸들러
		  $("#checkOut").on("change", function() {
		    var checkInDate = new Date($("#checkIn").val());
		    var checkOutDate = new Date($(this).val());

		    // 체크아웃 날짜가 체크인 날짜보다 과거인 경우
		    if (checkOutDate < checkInDate) {
		      // 체크인 날짜와 체크아웃 날짜를 바꿈
		      $("#checkIn").val($(this).val());
		      $("#checkOut").val($("#checkIn").val());
		    }
		    
		  });
	});
</script>
<jsp:useBean id="hotelService" class="com.hotel.model.hotelService" scope="session"></jsp:useBean>
<jsp:useBean id="hotelVO" class="com.hotel.model.hotelVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="hotelVO" />
<jsp:useBean id="facilitiesService" class="com.facilities.model.facilitiesService" scope="session"></jsp:useBean>
<jsp:useBean id="facilitiesVO" class="com.facilities.model.facilitiesVO" scope="page"></jsp:useBean>
<jsp:setProperty property="hotelNo" name="facilitiesVO" />
<jsp:useBean id="reviewService" class="com.review.model.reviewService" scope="session"></jsp:useBean>
<jsp:useBean id="reviewVO" class="com.review.model.reviewVO" scope="page"></jsp:useBean>
<jsp:useBean id="viewRoomService" class="com.reservation.model.ViewRoomService"></jsp:useBean>
<jsp:useBean id="remainedService" class="com.room.model.RemainedRoomService"></jsp:useBean>
<jsp:useBean id="memberService" class="com.member.model.MemberService"></jsp:useBean>
<jsp:useBean id="roomDetailSerivce" class="com.room_detail.RoomDetailService"></jsp:useBean>
<%
  //한글 인코딩
  request.setCharacterEncoding("UTF-8");
  //1.요청 파라미터 인코딩
  String hotelNo = request.getParameter("hotelNo");
  String keyword = request.getParameter("keyword");
  String checkIn = request.getParameter("checkIn");
  String checkOut = request.getParameter("checkOut");
  String people = request.getParameter("people");
  String qty = request.getParameter("qty");
  
  if(keyword==null) keyword="";
  if(checkIn==null) checkIn="";
  if(checkOut==null) checkOut="";
  if(people==null) people="";
  if(hotelNo==null || hotelNo.isEmpty()){
	  
  }
  
  
  hotelVO = hotelService.selectByhotelNo(Integer.parseInt(hotelNo));
  facilitiesVO = facilitiesService.selectByhotelNo(Integer.parseInt(hotelNo));
  double latitude = hotelVO.getLatitude();
  double longitude = hotelVO.getLongitude();
  
  //2. db작업
  
  List<ViewRoomVO> list = null;
  List<reviewVO> reviewList = null;
  
  try{
	list = viewRoomService.selectRoomList(Integer.parseInt(hotelNo));
	reviewList = reviewService.selectByhotelNo(Integer.parseInt(hotelNo));
	
  }catch(SQLException e){
	  e.printStackTrace();
  }
  int remained_room=-1;
  
  
	DecimalFormat df = new DecimalFormat("#,###");
	int subImg=1;
  
%>
<!-- 
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
</script> -->

<nav id="nav1">
<form name="frmSearch" method="post" action="hotelDetail.jsp">
	<div class="search_input rooms_box">
	<input type="hidden" name="hotelNo" value="<%=hotelNo %>"> 
			<div>
				<a href="#">
					<label style="margin-right: 100px;">위치</label><br>
					<input type="text" name="keyword" placeholder="어디,갈래?" value="<%=keyword %>">
				</a>
			</div>
			
			<div class="flight-search-date-start">
			<label style="margin-right: 70px;">체크 인</label>
		   	 <input type="date" name="checkIn" id="checkIn" value="<%=checkIn %>">
		    </div>
			
		     <div class="flight-search-date-end">
		     <label style="margin-right: 60px;">체크 아웃</label>
		    <input type="date" name="checkOut" id="checkOut" value="<%=checkOut %>">
		    </div>
	
				<%-- <a href="#">
					<label>인원</label><br> 
					<input type="number" name="people" value="<%=people %>">
				</a> --%>
			<div class="number-input">
				<label>인원</label><br> 
				<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
				<input class="quantity" id="people" min="1" name="people" value="<%=people %>" type="number">
				<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
			</div>
			<div>
				<button class="search_button" style="text-align: center;" id="searchBt">
					<img src="../images/search.png" class="magnifying_glass">
				</button>
			</div>
		</div> 
	<!-- serach input room -->
</form>
</nav>
<main class="container">
<h3 class="display-4 fst-italic" style="margin-top: 40px;"><%= hotelVO.getHotelName() %></h3>
  <div class="p-4 p-md-5 mb-4 rounded" style="width:1250px; height:300px; border: 2px solid gray; 
  background-image: url('<%=request.getContextPath()%>/images/<%=hotelVO.getImage()%>'); background-size:1250px 300px;">
    <div class="col-md-6 px-0">
      <br><br><br><br><br>
    </div>
  </div>
	<h3 style="color: #333333;">객실 유형</h3>
	<div class="row mb-2">
	<%for(int i=0; i<list.size(); i++){
		if((list==null || list.isEmpty()) || list.size()<1){%>
			
			
		<%}else{
			ViewRoomVO vo = list.get(i);
			remained_room=vo.getTotal_room();
			RoomDetailVO roomVo = roomDetailSerivce.selectRoomDetail(vo.getTypeNo());
			
			//날짜 선택시에만 잔여객실 조회
			if(checkIn!=null && !checkIn.isEmpty() && checkOut!=null && !checkOut.isEmpty()){
				RemainedRoomVO remainVo = remainedService.checkRemainedRoom(vo.getTypeNo(), checkIn, checkOut);
				
				if(remainVo!=null){//null이 아닐때만
					remained_room = remainVo.getRemained_room();
				}
				if(remainVo.getAsk_date()==null){
					remained_room = roomVo.getTotalRoom();
				}
				
			}%>
		    <div class="col-md-6">
		      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col p-4 d-flex flex-column position-static">
		          <h3 class="mb-0"><%=vo.getRoom_type() %> </h3>
		          <strong class="d-inline-block mb-2 text-primary"><%=df.format(vo.getPrice_per_day())%>￦</strong>
		          <p class="card-text mb-auto">
		          객실 상세 상품<br>
		           <%if(vo.getBed()>0){%>
		        	  <span><img alt="bed" src="../images/bedicon.png" class="icon">침대개수 <%=vo.getBed() %>개 </span><br>
		          <%}%>
		          <%if(vo.getWifi()==1){%>
		        	  <span><img alt="wifi" src="../images/wifi.png" class="icon">와이파이</span><br>
		          <%}%>
		          <%if(vo.getAc()==1){%>
		        	  <span><img alt="에어컨" src="../images/AcIcon.png" class="icon">에어컨</span><br>
		          <%}%>
		          <%if(vo.getKitchen()==1){%>
		        	  <span><img alt="주방" src="../images/kitchenicon.png" class="icon">주방</span><br>
		          <%}%>
		          </p>
		          
		          <div class="mb-1 text-muted">잔여객실 : <%=remained_room %>개</div>
		          
				<form name="frmReservation" method="post" action="<%=request.getContextPath()%>/hotel/payment.jsp">
					<input type="hidden" name="roomType" value="<%=vo.getRoom_type()%>">
					<input type="hidden" name="checkIn" value="<%=checkIn %>">
					<input type="hidden" name="checkOut" value="<%=checkOut %>">
					<input type="hidden" name="people" value="<%=people%>">
					<input type="hidden" name="1dayPrice" value="<%=vo.getPrice_per_day()%>">
					<input type="hidden" name="hotelNo" value="<%=hotelNo %>">
					<div class="number-input">
					  <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
					  <input class="quantity" id="roomQty" min="1" name="qty" value="<%=qty %>" type="number">
					  <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
					</div>
		          <button type="submit" class="btn btn-outline-secondary" id="reservation">예약</button>
				</form>
		        </div>
		        <div class="col-auto d-none d-lg-block">
		          	<img src="<%=request.getContextPath() %>/images/sub<%=subImg++ %>_<%=hotelVO.getImage()%>" style="width: 300px; height: 250px; border: 2px solid gray;">
		        </div>
		      </div>
		    </div>
		    <br><br>
	    <%} %>
    <%} %>
      </div>
      <%if(list.size()==0){%>
			<div style="border: 1px solid gray; margin: 0 auto; padding: 3px; width: 269px;">
		          <p>
		          이용의 불편들 드려 죄송합니다.<br>
		          해당 호텔은 객실을 준비 중 입니다.<br>
		          다른 호텔을 이용을 부탁드립니다.<br>
		          </p>
		          <img src="<%=request.getContextPath() %>/images/readyroom.jpg" style="width: 250px; height: 200px;">
			</div>
			
	   <%} %>
 <!--    </div>
  </div> -->

  <div class="row g-5">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 fst-italic border-bottom" style="background-color: #ffffff; background-color: rgba( 255, 255, 255, 0.5 );">
        <%=hotelVO.getHotelName() %>
      </h3>
      <h5>호텔주소 : <%=hotelVO.getAddress() %></h5>
      <hr>
      <article class="blog-post">
        <h2 class="blog-post-title mb-1">부대시설 정보</h2>
        <p class="blog-post-meta">January 1, 2021 by <a href="#">Mark</a></p>

        <%if(facilitiesVO.getConv_store()==1){%>
		<span><img alt="conStore" src="../images/conStore.png" class="icon">편의점</span><br>
		<%} %>
		<%if(facilitiesVO.getLaundry_room() == 1){%>
		<span><img alt="laundryRoom" src="../images/laundryRoom.png" class="icon">세탁실</span><br>
		<%} %>
		<%if(facilitiesVO.getParking() == 1){%>
		<span><img alt="parking" src="../images/parking.png" class="icon">주차장</span><br>
		<%} %>
		<%if(facilitiesVO.getValet_parking() == 1){%>
		<span><img alt="valetparking" src="../images/valetparking.png" class="icon">발렛파킹</span><br>
		<%} %>
		<%if(facilitiesVO.getBreakfast() == 1){%>
		<span><img alt="Breakfast" src="../images/breakfast.png" class="icon">조식</span><br>
		<%} %>
		<%if(facilitiesVO.getPool() == 1){%>
		<span><img alt="pool" src="../images/pool.png" class="icon">수영장</span><br>
		<%} %>
		<%if(facilitiesVO.getLounge_bar() == 1){%>
		<span><img alt="loungeBar" src="../images/loungeBar.png" class="icon">라운지바</span><br>
		<%} %>
		<%if(facilitiesVO.getAccompany_pet() == 1){%>
		<span><img alt="withPet" src="../images/withPet.png" class="icon">애완동물 동반 가능</span><br><br>
		<%} %>
        
        <hr>
        <table class="table">
          <thead>
            <tr>
              <th>작성자</th>
              <th>평점</th>
              <th>후기</th>
            </tr>
          </thead>
          <tbody>
          <%for(int i=0; i<reviewList.size(); i++){
          	reviewVO vo = reviewList.get(i);
          	MemberVO memberVo =memberService.selectMember(vo.getAccNo());%>
            <tr>
              <td style="width:100px;"><%=memberVo.getName() %></td>
              <td style="width:100px;">
              <%for(int j=0; j<5; j++){ 
              	if(j<vo.getScore()){%>
              		<input type="image" src="../images/fullStar.png" class="starIcon" alt="fullstar">
              	<%}else{%>
              		<input type="image" src="../images/emptyStar.png" class="starIcon" alt="emptyStar">
              	<%} %>
              <%} %>
              </td>
              <td><%=vo.getContent() %></td>
            </tr>
            <%} %>
          </tbody>
        </table>
    </div>

    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst-italic">사장님 한마디</h4>
          <p class="mb-0"><%=hotelVO.getHotelDetail() %></p>
        </div>

				<div class="p-4">


		<h4 class="fst-italic">호텔 MAP</h4>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77b09882911ce4058ee98aa8532ed409"></script>
		<script>
		
		window.onload=function(){
			
	      var container = document.getElementById('map');
	      var hotelLongitude = <%=hotelVO.getLongitude()%>;
	      var hotelLatitude = <%=hotelVO.getLatitude()%>;
	      console.log(hotelLongitude);
	      console.log(hotelLatitude);
	      
	      var options = {
	         center: new kakao.maps.LatLng(hotelLatitude,hotelLongitude),
	         level: 3
	      };

	      var map = new kakao.maps.Map(container, options);
	      
	      
	      var markerPosition  = new kakao.maps.LatLng(hotelLatitude, hotelLongitude); 
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            position: markerPosition
	        });
	        
	        
	        // 마커가 지도 위에 표시되도록 설정합니다
	        marker.setMap(map);
	        
	        
	        
	        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	        var iwContent = '<div style="padding:5px; width:100%"><%=hotelVO.getHotelName()%></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	        
	        // 인포윈도우를 생성합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content : iwContent,
	            removable : iwRemoveable
	        });
	        
	        // 마커에 클릭이벤트를 등록합니다
	        kakao.maps.event.addListener(marker, 'click', function() {
	              // 마커 위에 인포윈도우를 표시합니다
	              infowindow.open(map, marker);  
	        });
		};
		
		// 체크인과 체크아웃 날짜 input 요소 가져오기
		var checkInInput = document.getElementById("checkIn");
		var checkOutInput = document.getElementById("checkOut");
		
		// 체크인 날짜 변경 이벤트 리스너 등록
		document.getElementById('checkIn').addEventListener('change', function() {
			var checkInDate = new Date(checkInInput.value);
			var checkOutDate = new Date(checkOutInput.value);
			  
			// 체크인이 체크아웃보다 큰 경우 값 바꾸기
			if (checkInDate > checkOutDate) {
			    var temp = checkInInput.value;
			    checkInInput.value = checkOutInput.value;
			    checkOutInput.value = temp;
			}
			
			submitForm();
		});
		
		// 체크아웃 날짜 변경 이벤트 리스너 등록
		document.getElementById('checkOut').addEventListener('change', function() {
			var checkInDate = new Date(checkInInput.value);
			var checkOutDate = new Date(checkOutInput.value);
			  
			// 체크아웃이 체크인보다 작은 경우 값 바꾸기
			if (checkOutDate < checkInDate) {
			    var temp = checkInInput.value;
			    checkInInput.value = checkOutInput.value;
			    checkOutInput.value = temp;
			}
			submitForm();
		});

		function submitForm() {
			document.forms['frmSearch'].submit();
		}
		
		document.getElementById('reservation').addEventListener('click', function() {
			 ;
			  var checkIn = document.getElementById('checkIn').value;
			  var checkOut = document.getElementById('checkOut').value;
			  var people = parseInt(document.getElementById('people').value);
			  var roomQty = parseInt(document.getElementById('roomQty').value);

			  if (checkIn === '') {
			    alert('체크인 날짜를 선택해주세요.');
			    event.preventDefault();
			    return false;
			  }

			  if (checkOut === '') {
			    alert('체크아웃 날짜를 선택해주세요.');
			    event.preventDefault();
			    return false;
			  }

			  if (isNaN(people) || people < 1) {
			    alert('올바른 인원 수를 입력해주세요.');
			    event.preventDefault();
			    return false;
			  }

			  if (isNaN(roomQty) || roomQty < 1) {
			    alert('올바른 객실 수를 입력해주세요.');
			    event.preventDefault();
			    return false;
			  }
			  
			  function forceButtonClick() {
				  var searchButton = document.getElementById('searchBt');
				  searchButton.click();
			  }

			});

			// 수량 필드에서 숫자 이외의 입력을 방지하는 이벤트 핸들러
			var quantityFields = document.getElementsByClassName('quantity');
			for (var i = 0; i < quantityFields.length; i++) {
			  quantityFields[i].addEventListener('input', function() {
			    var value = this.value;
			    this.value = value.replace(/[^0-9]/g, '');
			  });
			}
		
		</script>
				</div>
			</div>
    </div>
  </div>
</main>




    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<%@include file="../Layout/bottom.jsp" %>