package com.mystudy.serv.pd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.pd.model.PdDAO;
import com.mystudy.pd.model.PdDTO;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//응답문서에 대한 contentType지정
		response.setContentType("text/html;charset=utf-8");
		
		//출력스트림 생성
		PrintWriter out = response.getWriter();
		//Write_ok 와 거의 유사
		//1
		request.setCharacterEncoding("utf-8");
		String pdName=request.getParameter("pdName");
		String price=request.getParameter("price");
		
		//2
		PdDAO pdDAO = new PdDAO();
		PdDTO dto = new PdDTO();
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		try {
		int cnt=pdDAO.insertPd(dto);
		//3
		if(cnt>0) {
			response.sendRedirect("/mystudy/ListServ");
								//-> 절대참조
		}else {
			out.print("등록 실패!");
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
