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

@WebServlet("/EditServ")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		//출력스트림 생성
		PrintWriter out = response.getWriter();

		//1 요청 파라미터 읽어오기
		String no = request.getParameter("no");

		out.print("<html><head><title>상품 수정</title></head>");
		
		if (no == null || no.isEmpty()) {
			out.print("<script>");
			out.print("alert('잘못된 URL입니다.');");
			out.print("location.href='/mystudy/ListServ';");
					//sendRedirect 사용하면 alert이 안떠서 location,alert 같이 쓰어야함
			out.print("</script>");
			
			return;
		}
		
		//2.db작업
		PdDAO pdDao = new PdDAO();
		PdDTO dto=null;
		try{
			dto=pdDao.selectByNo(Integer.parseInt(no));	
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//3. 화면 출력
		out.print("<body>");
		out.print("<h1>상품 수정</h1>");
		out.print("<form name='frmEdit' method='POST' action='/mystudy/Edit_okServ'>");
		out.print("<input type='hidden' name='no' value='"+no+"'>");
		out.print("상품명: <INPUT TYPE='text' NAME='pdName' value='"+dto.getPdName()+"'><br>");
		out.print("가격:<INPUT TYPE='text' NAME='price' value='"+dto.getPrice()+"'><br>");
		out.print("<INPUT TYPE='submit' value='등록'>");
		out.print("<INPUT TYPE='reset' value='취소'>");
		out.print("</form>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}
}