package board.modify.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.read.model.readBoardInfo;
import controller.Controller;
import jdbc.ConnectionProvider;

public class ModifyBoardController implements Controller{
	
	private BoardDao dao = new BoardDao();

	private final static String VIEW_CODE= "/WEB-INF/view/list/modify/modifyAticle.jsp";
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processPost(request, response);
		}else {
		 	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}
	private String processGet(HttpServletRequest request, HttpServletResponse response) {
		
		String boardNo_ = request.getParameter("no");//<< 페이지 고유번호
		int boardNo = Integer.valueOf(boardNo_);
		try {
			//여기부터는 서비스 단이므로 시험.
			Connection con = ConnectionProvider.getConnection();
			readBoardInfo boardInfo = dao.SelectbyBoardId(con, boardNo);
			request.setAttribute("boardInfo", boardInfo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return VIEW_CODE;
	}
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) {
		request.getAttribute("");
		
		return "";
	}
}
