<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.notice.model.NoticeVO"%>
<%@page import="com.notice.model.NoticeService"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1.요청 파라미터 읽어오기(POST)
	//파일 업로드
	String upPath = "/upload";

	//업로드할 폴더의 절대경로 구하기
	String saveDir = config.getServletContext().getRealPath(upPath);
	saveDir = application.getRealPath(upPath);
	
	if(saveDir == null){
		saveDir =upPath;
	}
	
	System.out.println("saveDir = " + saveDir);
	
	saveDir = "C:\\Users\\Desktop\\eclipse-workspace\\semiJY\\src\\main\\webapp\\upload";
	System.out.println("test saveDir="+saveDir);
	
	int maxSize = 2*1024*1024;
	String encoding = "utf-8";
	
	try{
		DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, df );
		System.out.println("파일 업로드 완료!");
		
		String fileName = multi.getFilesystemName("upfile");
		long fileSize = 0;
		String originFileName = "";
		
		if(fileName!=null){
			File myFile = multi.getFile("upfile");
			fileSize = myFile.length();
			
			originFileName = multi.getOriginalFileName("upfile");
		}
		
		int adminNo = 1;
		String annNo = multi.getParameter("annNo");
		String annTitle = multi.getParameter("annTitle");
		String annContent = multi.getParameter("annContent");
		
		//2. DB작업
		NoticeService noticeSer = new NoticeService();
		NoticeVO vo = new NoticeVO();
		
		vo.setAnnNo(Integer.parseInt(annNo));
		vo.setAnnTitle(annTitle);
		vo.setAnnContent(annContent);
		vo.setAdminNo(adminNo);
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginFileName(originFileName);
		
		int cnt = noticeSer.updateNotice(vo);
		
		//3.결과 처리
		if(cnt>0){%>
			<script type="text/javascript">
				alert(' 수정완료되었습니다.');
	    		location.href="noticeList.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
	    		alert('수정 실패!');
	    		history.back();
	    	</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>