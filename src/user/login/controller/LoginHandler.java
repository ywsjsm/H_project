package user.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import user.login.model.User;

public class LoginHandler implements Controller{
	
	private final static String VIEW_CODE= "/WEB-INF/view/login/Login.jsp";
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
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) {
		
//		String id = trim(request.getParameter("id"));
//		String password = trim(request.getParameter("password"));
//		
//		Map<String, Boolean> errors = new HashMap<>();
//		request.setAttribute("errors", errors);
//		
//		if (id == null || id.isEmpty()) {
//			errors.put("id", true);
//		}
//		
//		if (password == null || password.isEmpty()) {
//			errors.put("password", true);
//		}
//		
//		if (!errors.isEmpty()) {
//			return FORM_VIEW;
//		}
//		
//		try {
//			User user = LoginService.login(id, password);
//			request.getSession().setAttribute("authUser", user);
//			request.sendRedirect(request.getContextPath() + "/index.jsp");
//			return null;
//		} catch (LoginFailException e) {
//			errors.put("idOrPwNotMatch",  true);
//			return FORM_VIEW;
//		}
		return "";
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}
