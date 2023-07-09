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

@WebServlet("/DeleteServ")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		//출력스트림 생성
		PrintWriter out = response.getWriter();

		//1 요청 파라미터 읽어오기
		String no = request.getParameter("no");


		if (no == null || no.isEmpty()) {
			out.print("<script>");
			out.print("alert('잘못된 URL입니다.');");
			out.print("location.href='/mystudy/ListServ';");
					//sendRedirect 사용하면 alert이 안떠서 location,alert 같이 쓰어야함
			out.print("</script>");
			
			return;
		}
		
		//2 db작업
		PdDAO pdDao = new PdDAO();

		try {
			int cnt = pdDao.delete(Integer.parseInt(no));

			if (cnt > 0) {
				response.sendRedirect("/mystudy/ListServ");
			} else {
				out.print("상품 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		out.close();
	}

}