package com.mystudy.serv.pd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.pd.model.PdDAO;
import com.mystudy.pd.model.PdDTO;

@WebServlet("/DetailServ")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답문서에 대한 contentType 지정
		response.setContentType("text/html;charset=utf-8");
		//출력스트림 생성
		PrintWriter out = response.getWriter();
		
		//1 요청파라미터 읽어오기(get일때는 인코딩X)
		String no = request.getParameter("no");
		
		if (no == null || no.isEmpty()) {
			out.print("<script>");
			out.print("alert('잘못된 URL입니다.');");
			out.print("location.href='/mystudy/ListServ';");
			out.print("</script>");
			
			return;
		}
		
		
		//2 db작업
		PdDAO pdDao = new PdDAO();
		PdDTO dto = null;
	   
	    try {
			dto = pdDao.selectByNo(Integer.parseInt(no));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//3 결과 출력
	    DecimalFormat df = new DecimalFormat("#,###");
	    
		out.print("<html><head><title>상세보기 - 서블릿</title>");		
		out.print("<script type='text/javascript'>");		
		out.print("function deletePd(){");
		out.print("	if(confirm('삭제하시겠습니까?')){");
		out.print("		location.href='/mystudy/DeleteServ?no="+ no +"';");		
		out.print("	}");		
		out.print("}//for");		
		out.print("</script>");		
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>상품 상세보기</h1>");
		out.print("<p>번호 : "+ no + "</p>");
		out.print("<p>상품명 : "+ dto.getPdName() + "</p>");
		out.print("<p>가격 : "+ df.format(dto.getPrice()) + "원</p>");
		out.print("<p>등록일 : "+ dto.getRegdate() + "</p>");		
		out.print("<a href='/mystudy/ListServ'>목록</a> | ");		
		out.print("<a href='/mystudy/EditServ?no=" + no + "'>수정</a> | ");
		out.print("<a href='#' onclick='deletePd()'>삭제</a>");		
		out.print("</body>");		
		out.print("</html>");
		
		out.close();
	}

}
