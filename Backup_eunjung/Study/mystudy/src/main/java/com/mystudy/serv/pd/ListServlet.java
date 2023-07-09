package com.mystudy.serv.pd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.pd.model.PdDAO;
import com.mystudy.pd.model.PdDTO;

//@WebServlet("/ListServ")
public class ListServlet extends HttpServlet {
	//ListServ url 들어오면 class ListServlet를 처리해라
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답문서에 대한 contentType지정
		response.setContentType("text/html;charset=utf-8");
		
		//출력스트림 생성
		PrintWriter out = response.getWriter();
		
		//1		
		//2
		PdDAO pdDao = new PdDAO();
		List<PdDTO> list=null;
		try {
			list=pdDao.selectAll();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		DecimalFormat df = new DecimalFormat("#,###");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//3
		out.print("<html><head><title>상품 목록</title></head>");		
		out.print("<body>");
		out.print("<h1>상품 목록</h1>");
		out.print("<table border='1'>");
		out.print("<tr>");
		out.print("<th>번호</th>");
		out.print("<th>상품명</th>");
		out.print("<th>가격</th>");
		out.print("<th>등록일</th>");		
		out.print("</tr>");
		
		//반복 시작
		for(int i=0;i<list.size();i++) {
			PdDTO dto=list.get(i);
			out.print("<tr>");
			out.print("<td>"+ dto.getNo() + "</td>");
			out.print("<td><a href='/mystudy/DetailServ?no="+dto.getNo()+"'>"
					+ dto.getPdName() + "</a></td>");
			out.print("<td style='text-align:right'>"
					+ df.format(dto.getPrice()) + "</td>");
			out.print("<td>"+ sdf.format(dto.getRegdate()) + "</td>");			
			out.print("</tr>");
		}//for
		
		out.print("</table>");		
		out.print("</body>");
		out.print("</html>");
		
		out.close();
		
	}

}














