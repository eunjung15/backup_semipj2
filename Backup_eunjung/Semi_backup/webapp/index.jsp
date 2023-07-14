<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/Layout/top.jsp" %>
<style>
.parent {
 margin: 0 auto;
 margin-top: 0 auto;
 width:620px;
}

.flight-search-container {
  border:black 1px solid;
}

.flight-search-options{
    padding-top:10px;
  padding-bottom:10px;
}
.flight-search-options > div {
  display: inline-block;
  width:32%
}

.flight-search-options select {
  display: block;
  min-height: 30px;
  width:90%;
  margin:auto;
}
.flight-search-destination{
  padding-top:10px;
  padding-bottom:10px;
}

.flight-search-destination > div {
  display: inline-block;
  width:24%;
/*   border:1px solid red; */
}

.flight-search-destination input[type="date"],
.flight-search-destination input[type="text"]{
  display: block;
  min-height: 30px;
  width:90%;
  margin:auto;
}

.flight-search-date > div{
  display: inline-block;
}



.flight-search-go{
  padding-top:10px;
  padding-bottom:10px;
  
}


.flight-search-go button {
  
 display: block;
  min-width:60px;
  min-height:30px;
  margin:auto;
}

/*START passenger select*/
.hide{
  display:none;
}

.passengers-select-container{
  border: 1px solid yellow;
  min-width:100px;

}

.passengers-select-text{
  padding:5px;
}


.passengers-select-option:hover{
  background-color:blue;
  color:white;
  cursor: pointer;
 
}
.passengers-select-options-container{
  position: absolute;
  z-index:1;
  background-color:white;
  border: 1px solid red;
}

.passengers-select-option {
  padding-top:10px;
  padding-bottom:10px;
}
.passengers-select-option input[type="number"]{
  border:none;
  background-color:transparent;
  width:30%;
  display:inline-block;
  float:right;
  height: 100%;
}
/*END passenger select*/
</style>
<script type="text/javascript" src="">
$(".passengers-select-text").click(function() {
	  
	  if(!$(".passengers-select-option").hasClass("hide")){
	    $(".fa-angle-down").toggleClass("hide")
	    $(".fa-angle-up").toggleClass("hide");
	    var sum=0;
	  $(".passengers-select-option input").each(function(index, elem) {
	    sum += parseInt($(elem).val());
	    $(".passengers-select-nmb").text(sum);
	  });
	  }
	  
	  $(".passengers-select-options-container").toggleClass("hide");
	  
	});
</script>
<div class="parent">
<div class="flight-search-container">
  <div class="flight-search-destination">
    <div class="flight-search-destination-from">
    
  <input type=text class="flight-from" placeholder="어디로 갈래?">
  </div>

    <div class="flight-search-date-start">
    <input type="date">
    </div>
     <div class="flight-search-date-end">
    <input type="date">
    </div>
  </div>
  <div class="flight-search-go">
    <button class="flight-search-go-btn"> 갈래! </button>
  </div>
</div>
</div>

<%@include file="/Layout/bottom.jsp" %>

