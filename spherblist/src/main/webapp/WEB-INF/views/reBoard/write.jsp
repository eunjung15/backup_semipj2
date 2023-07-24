<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mystyle.css'/>" />

<c:if test="${!empty param.no }">
	<c:set var="pageTitle" value="글수정" />
	<c:set var="btLabel" value="수정" />
	<c:set var="url" value="/reBoard/edit" />
	<c:set var="no" value="${param.no }" />	
</c:if>
<c:if test="${empty param.no }">
	<c:set var="pageTitle" value="글쓰기" />
	<c:set var="btLabel" value="등록" />
	<c:set var="url" value="/reBoard/write" />
	<c:set var="no" value="0" />	
</c:if>


<title>자료실 ${pageTitle } - 허브몰</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
        $('#title').focus();
		
		$('input[type=button]').click(function(){
			location.href	= "<c:url value='/reBoard/list'/>";
		});
		
		$('input[type=submit]').click(function(){
		   $('.infobox').each(function(idx, item){
		      if($(this).val().length <1){
		         alert($(this).prev().text() + '를 입력하세요');
		         $(this).focus();
		         event.preventDefault();
		         return false;
		      }
		   });
		   
		});
		
		
	});
</script>

</head>
<body>
<div class="divForm">
<form name="frmWrite" method="post" enctype="multipart/form-data"
		action="<c:url value='${url}'/>" >	
	
 <fieldset> 
	<legend>${pageTitle }</legend>
		<!-- 수정 처리시 no가 필요하므로 hidden 필드에 넣어서 보내준다 -->
		<input type="text" name="no" value="${no}">
		<input type="text" name="oldFileName" value="${vo.fileName}">
				
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" class="infobox" 
            	value="${vo.title}"/>
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" class="infobox" 
            	value="${vo.name}"/>
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" class="infobox" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="${vo.email}"/>
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40">${vo.content}</textarea>
        </div>
        <div>
            <label for="upfile">첨부파일</label>
            <input type="file" id="upfile" name="upfile"/><span>(최대 2M)</span>
            <!-- 글수정 && 파일첨부된 경우 -->
            <c:if test="${!empty param.no && !empty vo.fileName}"> 
	            <br>
            	<span class="sp1"></span>
            	<span style="color:darkgreen;font-weight: bold">
            		첨부파일을 새로 지정할 경우 기존파일 ${fileInfo}은 삭제됩니다.
            	</span>
            </c:if>
        </div>
        <div class="center">
            <input type = "submit" value="${btLabel}"/>
            <input type = "Button" value="글목록" />         
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>