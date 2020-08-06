package board.read.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class ReadBoardController implements Controller{
	
	private final static String VIEW_CODE= "/WEB-INF/view/list/read/readAticle.jsp";
	
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
			Object check = request.getParameter("no");
					
					
		return VIEW_CODE;
	}
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) {
String check = request.getRequestURI().toString();
		
		System.out.println(check);
		
		return "";
	}
}
