package com.mystudy.serv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetServ")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");		
		//=>응답문서에 대한 컨텍트타입 지정
		
		//출력 스트림 생성
		PrintWriter out=response.getWriter();
		//          2  //  1
		
		//1 파라미터 읽기(인코딩x)
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//       2//1
		//2 db 처리
		
		//3 결과출력
		out.print("<html><head><title>서블릿 - get</title></head>");
		out.print("<h1>get-요청 파라미터 값</h1>");
		out.print("<p>아이디 : "+id+"</p>");
		out.print("<p>비밀번호 : "+pwd+"</p>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}
}

