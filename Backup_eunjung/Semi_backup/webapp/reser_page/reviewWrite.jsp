<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/header.jsp"%>
<!-- <link rel="stylesheet" type="text/css" href="/css/noticeWriteCss.css" />  -->
<title>호텔 리뷰 등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 14px;
}

.box {
	width: 1000px;
	margin: 60px auto;
}

.mb-3 {
	margin-top: 1rem;
}

strong {
	font-size: 2rem;
}

.form-select {
	margin-top: 30px;
	margin-bottom: 20px;
}

.mb-4 {
	text-align: center;
}

.mb-5 {
	float: right;
}

#btn1 {
	width: 91px;
	height: 35px;
	border: 2px solid #4857A5;
	border-radius: 6px;
	background: #4857A5;
	margin-bottom: 10px;
	text-align: center;
	color: white;
	font-size: 15px;
	font-weight: bold;
}

#btn2 {
	width: 91px;
	height: 35px;
	border: 2px solid #4857A5;
	border-radius: 6px;
	background: #4857A5;
	margin-bottom: 10px;
	margin-left: 7px;
	color: white;
	font-size: 15px;
	font-weight: bold;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('../images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

#foot {
	clear: both;
}

.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('../images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}


.form-control{
	width : 40%;
}
.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid black;
}

.wrap {
    margin: 0 0;
    background-color: #fff;
    height: 80%;
    box-sizing: border-box;
    padding: 0;
}

.mb-6>textarea {
    width: 900px;
    height: 300px;
}

.mb-5 {
    float: right;
    margin-right: 100px;
    margin-top: 20px;
}

</style>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="../tool/naver-smarteditor2-ca95d21/demo/js/service/HuskyEZCreator.js"
		charset="utf-8"></script>
	<div class="box">
		<form name="frm" method="post" action="reviewWrite_ok.jsp">
			<strong>리뷰 등록</strong>
			<p class="title_star">별점과 리뷰를 남겨주세요.</p>

			<!--  <select class="form-select" aria-label="Default select example" name="selectOption">
			  <option selected>말머리 선택</option>
			  <option value="1">호텔관련</option>
			  <option value="2">예약관련</option>
			  <option value="3">기타</option>
			</select>
			-->
			<div class="mb-3">
				<input type = "hidden" name="hotelNo" value ="1">
				<input type = "hidden" name = "accNo" value = "1">
				<input type = "hidden" name = "room_type" value = "1"><br>
				<label for="exampleFormControlInput1" class="form-label">호텔</label>
				<!-- 관리자번호 FK이므로 hidden 필드에 넣어서 보내주기 -->
				<input type="text" class="form-control"
					id="exampleFormControlInput1" name="hotel"
					value = "">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">숙박일자</label>
				<!-- 관리자번호 FK이므로 hidden 필드에 넣어서 보내주기 -->
				<input type="text" class="form-control"
					id="exampleFormControlInput1" name="hotelday"
					value = "">
			</div>
			<div class="wrap">
				<div class="review_rating">
				 <input type="hidden" name="rate" id="rate" value="1"/>
					<div class="warning_msg">별점을 선택해 주세요.</div>
						<div class="rating">
			                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
			                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
			                <label for="rating1"></label>
			                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
			                <label for="rating2"></label>
			                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
			                <label for="rating3"></label>
			                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
			                <label for="rating4"></label>
			                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
			                <label for="rating5"></label>
			            </div>
					</div>
			</div>

			<div class="mb-6">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					name="content" rows="30" placeholder="내용을 입력해주세요."></textarea>
			</div>

			<div class="mb-5">
				<input type="submit" id="btn1" value="등록" onclick=submitContents()>
				<input type="button" id="btn2" value="취소" onclick="location.href= 'reviewList_byAccNo.jsp'">
			</div>
		</form>
	</div>
</body>
<%@ include file="../form/bottom.jsp"%>
<script type=text/javascript src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	
	//Editor Setting
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef: oEditors,
		elPlaceHolder: "exampleFormControlTextarea1", //아이디
		sSkinURI: "../tool/naver-smarteditor2-ca95d21/demo/SmartEditor2Skin.html",
		fCreator : "createSEditor2",	
	/*	htParams : {	//툴바 사용 여부
			bUseToolbar : true	//입력창 크기 조절바 사용 여부
			//bUseVerticalResizer : true;	//모드 탭(Editor) 사용 여부
			bUseModeChanger : true	//전송버튼 클릭
		}*/
		
	});
	
	function submitContents(){
		//에디터의 내용  textarea에 적용
		oEditors.getById["exampleFormControlTextarea1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	}
	
	$(function(){
		$('#exampleFormControlInput1').focus();
		
		$('#btn1').click(function(){
			if($('#exampleFormControlInput1').val().length<1){
				alert("제목을 입력하세요.");
				$('#exampleFormControlInput1').focus();
				return false;
			}else if($('#exampleFormControlTextarea1').val()===''){
				alert("내용을 입력하세요.");
				$('#exampleFormControlTextarea1').focus();
				return false;
			}	
			
		})
		
	})
		
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		    this.rate = newrate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		}
		let rating = new Rating();//별점 인스턴스 생성
		
		
		
		document.addEventListener('DOMContentLoaded', function(){
			 // 별점 선택 이벤트 리스너
		    const rateRadios = document.querySelectorAll('.rate_radio');
		    const rateInput = document.getElementById('rate');

		    rateRadios.forEach(function(radio) {
		        radio.addEventListener('change', function() {
		            const rateValue = this.value;
		            rateInput.value = rateValue;
		        });
		    });
		});
</script>