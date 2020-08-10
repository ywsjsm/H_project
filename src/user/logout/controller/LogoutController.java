package user.logout.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

public class LogoutController implements Controller{
	private static final String VIEW_CODE = "/WEB-INF/view/logout/logoutComplete.jsp";
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processGet(request,response);
		}else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}


	private static String processGet(HttpServletRequest request, HttpServletResponse response){
		System.out.println("로그아웃 Get 요청 받음");
			HttpSession session = request.getSession();
			
			session.invalidate();
		return VIEW_CODE;
	}

	
}
