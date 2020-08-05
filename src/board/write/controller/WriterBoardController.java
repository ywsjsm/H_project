package board.write.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import board.write.model.BoardWriteRequest;
import board.write.service.WriteArticleService;
import controller.Controller;
import user.signup.model.SingnUpRequest;

public class WriterBoardController implements Controller{
	private final static String VIEW_CODE= "/WEB-INF/view/list/write/writeArticle.jsp";
	private WriteArticleService writeService = new WriteArticleService();
	
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
		return VIEW_CODE;
	}
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Part filePart = request.getPart("fileName");
		String fileName = filePart.getSubmittedFileName();
		
		fileName = fileName == null ? "" : fileName;
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		SingnUpRequest user = (SingnUpRequest) request.getSession(false).getAttribute("");
		BoardWriteRequest WriteReq = createWriteRequest(request, fileName);
		//WriteReq.validate(errors); 에러 처리 필요
		writeService.write(WriteReq);
		
		return "";
	}
	
	private BoardWriteRequest createWriteRequest(HttpServletRequest req, String fileName) {

		return new BoardWriteRequest(
						req.getParameter("title"),
						req.getParameter("content"),
						fileName,
						new Date()
						);
	}
}
