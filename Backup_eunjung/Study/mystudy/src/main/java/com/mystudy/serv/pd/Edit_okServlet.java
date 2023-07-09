package com.mystudy.serv.pd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.pd.model.PdDAO;
import com.mystudy.pd.model.PdDTO;

@WebServlet("/Edit_okServ")
public class Edit_okServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		//1
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");

		String no=request.getParameter("no");
		String pdName=request.getParameter("pdName");
		String price=request.getParameter("price");
		//2
		PdDAO pdDao = new PdDAO();
		PdDTO dto = new PdDTO();
		System.out.println("확인용========================");
		
		dto.setNo(Integer.parseInt(no));
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		
		try{
			int cnt=pdDao.updatePd(dto);
			
			//3
			if(cnt>0){
				response.sendRedirect("/mystudy/DetailServ?no=" + no);
			}else{
				out.println("수정 실패!");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
}