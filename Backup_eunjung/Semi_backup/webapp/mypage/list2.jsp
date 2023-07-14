<%@page import="com.common.Utility"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.common.Utility"%>
<%@page import="com.reboard.model.ReBoardVO"%>
<%@page import="com.reboard.model.ReBoardDAO"%>
<%@page import="com.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>결제 된 여행 목록</title>
<meta charset="utf-8">
<!-- <link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" /> -->
<style type="text/css">

body, td, th, span, p{
	font-family: 'nanum gothic', 맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	color:#555555;
}
	
td, th{
	padding:4px;
}


table{
	margin: 0;
	padding: 0;
	border-collapse: collapse;
}

table.box, table.box2{
	margin: 0;
	padding: 0;
	border: solid silver 1px;
	border-collapse: collapse;
}

table.box2 th{
	background-color: #eeeeee;
	border: solid silver 1px;
}

table.box2 td{
	border: solid silver 1px;	
}

td.line
{
	border-bottom:solid 1px silver;
}

/* 표 css */
.divList, .divPage, .divSearch, .divRight, .divList table{
		width:700px;
	}	
	.divList{
		margin:10px 0;
	}
	caption{
		visibility:hidden;
		font-size:0.1em;
	}	
	.divPage{
		text-align:center;		
		padding:5px 0;
	}	
	.divSearch{
		text-align:center;		
		padding:5px 0 2px 0;
	}	
	.divBtn{
		text-align:right;	
		width:700px;
	}
	.divBtn a{
		font-size:1.0em;
	}
	.divRight{
		text-align:right;	
		width:700px;
	}


</style>
<script type="text/javascript" src="../js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
	    $('.box2 tbody tr').hover(function(){
	       $(this).css('background','skyblue');
	    },function(){
	       $(this).css('background','');
	    });
	 });
</script>
<style type="text/css">
		body{
		padding:5px;
		margin:5px;
		transform: translate(25%, 0%);
		margin-top: 50px;
		}
		
		h2 {
		    float: left
		    margin-top: 30px;
		    font-weight: bold;
		}
		
		button.w-100.btn.btn-primary.btn-lg {
		    float: right;
		}
</style>	
</head>	
<body>
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
	
		if(hotelname==null) hotelname="";	
		
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
<h2>예약된 여행 게시판</h2>
<div>
   <%if(accNo!=null && !accNo.isEmpty()){%>
   <p>검색어 :<%=hotelname %> <%=list.size() %> 건 예약되었습니다.</p>
   <%}%>
</div>
<div class="divList">
<table class="box2"
	 	summary="호텔 예약내역에 대한 정보를 제공합니다.">
	<caption>지난 예약 목록</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">날짜</th>
	    <th scope="col">호텔명</th>
	    <th scope="col">체크인일</th>
	  </tr>
	</thead> 
	<tbody>  
	  <%if(list==null || list.isEmpty()){ %>
	  	<tr><td colspan="5" class="align_center">예약이 존재하지 않습니다.</td></tr>
	  <%}else{ %>
	  	<!--게시판 내용 반복문 시작  -->	
	  	<%
	  	//5번씩만 반복
	  	for(int i=0;i<pageSize;i++){
	  		if(num<1) break;
	  		
	  		vo=list.get(curPos++);
	  		num--;
	  	%>	
			<tr  style="text-align:center">
				<td><%=vo.getRecode() %></td>
				<td style="text-align:left">
							<%=Utility.cutString(vo.getHotelname(), 35) %>
					   	<span style="color:gray">삭제된 글입니다.</span>
						<a href="countUpdate.jsp?no=<%=vo.getAccno()%>">
						</a>
						<!-- 24시간 이내의 글인 경우 new이미지 보여주기 -->
						<%=Utility.displayNew(vo.getCheck_in_date()) %>
					<%} %>	
				</td>
				<td><%=vo.getHotelname() %></td>
				<td><%=sdf.format(vo.getCheck_in_date()) %></td>
			</tr> 
		<%}//for %>
	  	<!--반복처리 끝  -->
	  
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<%if(firstPage>1){%>
		<a href="list2.jsp?currentPage=<%=firstPage-1%>">
			<img src="../images/first.JPG">
		</a>	
	<%} %>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=firstPage;i<=lastPage;i++){
		if(i>totalPage) break;
	
	    if(i == currentPage){ %>
         <span style="color: blue;font-weight: bold;font-size: 1em"><%=i%></span>
   <%   }else{   %>
         <a href="list2.jsp?currentPage=<%=i%>&searchKeyword=<%=hotelname%>&searchCondition=<%=condition %>">[<%=i %>]</a>
   <%   }//if      
	}//for %>
	
	<!-- 다음 블럭으로 이동 -->
	<%if(lastPage< totalPage){%>
		<a href="list2.jsp?currentPage=<%=lastPage+1%>">
			<img src="../images/last.JPG">
		</a>	
	<%} %>
	
	<!--  페이지 번호 끝 -->
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" action='list2.jsp'>
        <select name="searchCondition">
            <option value="check_In_Date" 
            	<%if("check_In_Date".equals(condition)){%>
            		selected="selected"
            	<% }%>            	
            >날짜</option>
            <option value="hotelname"
            	<%if("hotelname".equals(condition)){%>
            		selected="selected"
            	<% }%> 
            >호텔명</option>
            <option value="room_type" 
            	<%if("room_type".equals(condition)){%>
            		selected="selected"
            	<% }%> 
            >객실타입</option>
        </select>   
        <input type="text" name="searchKeyword" title="호텔검색 입력" 
        	value="<%=hotelname%>">   
		<input type="submit" value="검색">
		<a href="../reser_page/reviewWrite.jsp">
		<button class="w-100 btn btn-primary btn-lg" type="submit" >리뷰 작성</button></a>
    </form>
</div>


</body>
</html>

