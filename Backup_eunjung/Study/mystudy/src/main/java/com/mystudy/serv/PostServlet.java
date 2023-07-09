package com.mystudy.serv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostServ")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//응답문에서 대한 컨텐트 타입 지정
		response.setContentType("text/html;charset=utf-8");
		
		//출력 스트림 생성
		PrintWriter out=response.getWriter();
		
		//1
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		//2
		//3
		out.print("<html><head><title>서블릿 - post</title></head>");
		out.print("<h1>post-요청 파라미터 값</h1>");
		out.print("<p>아이디 : "+id+"</p>");
		out.print("<p>비밀번호 : "+pwd+"</p>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}

}
