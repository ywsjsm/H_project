package board.modify.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import board.dao.BoardDao;
import board.modify.model.ModifyArticleRequest;
import board.modify.service.ModifyArticleService;
import board.read.model.readBoardInfo;
import board.write.service.WriteFileService;
import controller.Controller;
import jdbc.ConnectionProvider;
import user.model.User;

public class ModifyBoardController implements Controller{
	private ModifyArticleService service = ModifyArticleService.getModifyArticleService();
	private BoardDao dao = new BoardDao();
	private WriteFileService writeFile = new WriteFileService();

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
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Map<String, Boolean> errors = new HashMap<>();
		
		Part filePart = request.getPart("fileName");
		String fileName = filePart.getSubmittedFileName();
		
		fileName = fileName == null ? "" : fileName ;
				
		ModifyArticleRequest req = mappingObject(request,fileName);
		User user = (User) request.getSession().getAttribute("userInfo");
		
		request.setAttribute("errors", errors);
		errors = req.validate(errors);
		
		if(!errors.isEmpty()) {
			return VIEW_CODE;
		}
			
		try {
			service.modify(req,user,errors);//<내용 채우기 필요
			if(!(fileName  == null || fileName.isEmpty() || filePart.getSize() ==0)) {
				writeFile.write(filePart);//< 중복 파일 로직 추가 필요
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	private ModifyArticleRequest mappingObject(HttpServletRequest request,String fileName) {
		int no = Integer.valueOf(request.getParameter("no"));
		return new ModifyArticleRequest(no,request.getParameter("title"),request.getParameter("content"),fileName);
	}
}
