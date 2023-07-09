package com.mystudy.serv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LifeCycle")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int num;
	
	public LifeCycle() {
		System.out.println("생성자 호출!");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 메서드 호출!");
	}


	@Override
	public void init(ServletConfig config) throws ServletException {
		num++;
		System.out.println("init()메서드 호출, num="+num);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 메서드 호출!!!");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>servlet 생명주기</title></head>");
		out.print("<body>");
		out.print("<h1>현재 스레드 이름 : "+ Thread.currentThread().getName()+ "</h1>");
		out.print("</body>");
		out.print("</html>");
		
	}

}






