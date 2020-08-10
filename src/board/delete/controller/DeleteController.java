package board.delete.controller;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.BoardDao;
import board.delete.model.DeleteArticleRequest;
import board.delete.service.DeleteArticleService;
import board.read.model.readBoardInfo;
import controller.Controller;
import jdbc.ConnectionProvider;
import user.model.User;

public class DeleteController implements Controller{
	private BoardDao dao = new BoardDao();
	private static DeleteArticleService service = DeleteArticleService.getDeleteArticleService();
private final static String COMPLETE_DELETE_ARTILCE ="/WEB-INF/view/list/delete/CompleteDeleteAticle.jsp";	
private final static String VIEW_CODE= "/WEB-INF/view/list/delete/deleteAticle.jsp";
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//BoadInfo 객체 넘겨줘야함
		readBoardInfo boardInfo = null;
		int boardNo = 0;
		try(Connection con = ConnectionProvider.getConnection()){
			boardNo = Integer.valueOf(request.getParameter("no"));
			boardInfo = dao.SelectbyBoardId(con, boardNo);	
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("boardInfo", boardInfo);
		
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
		return VIEW_CODE;
	}
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User userInfo = (User)session.getAttribute("userInfo");
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		DeleteArticleRequest req = mappingObject(request);
		try {
		errors = service.deleteArticle(req, userInfo, errors);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("글 삭제의 errors의 사이즈 : "+errors.size());
		if(!errors.isEmpty()) {
			return VIEW_CODE;		
		}else {
			return COMPLETE_DELETE_ARTILCE;
		}
	}
	
	private DeleteArticleRequest mappingObject(HttpServletRequest request) {
		return new DeleteArticleRequest(request.getParameter("password"),
				request.getParameter("confirmPassword"), Integer.valueOf(request.getParameter("no")));
	}
	
}
