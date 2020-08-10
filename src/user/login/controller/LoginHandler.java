package user.login.controller;



import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import user.login.model.LoginRequest;
import user.login.service.LoginService;
import user.model.User;

public class LoginHandler implements Controller{
	private final static String COPLETE_VIEW_CODE="/WEB-INF/view/login/LoginComplete.jsp";
	private static LoginService service = LoginService.getLoginService();
	
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
		Cookie[] cookies = request.getCookies();
		
		for(Cookie coo : cookies) {
			if(coo.getName().equals("UserIdCookie")) {
				request.setAttribute("UserIdCookie", URLDecoder.decode(coo.getValue()));
			}
		}
		return VIEW_CODE;
	}
	
	
	private String processPost(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("포스트요청 감지");
		LoginRequest req = mappingObject(request, response);
		
		Map<String , Boolean> errors = new HashMap<>();
		request.setAttribute("loginReq", req);
		request.setAttribute("errors", errors);
		
		errors = req.validate(errors);
		User userInfo = null;
		try {
			userInfo = service.login(req, errors);
		}catch(Exception e) {
			e.printStackTrace();
			return VIEW_CODE;
		}
		if(!errors.isEmpty()) {
			return VIEW_CODE;
		}
		HttpSession session = request.getSession();
		if(!req.isRememberId()) {
			Cookie cookie = new Cookie("UserIdCookie",URLEncoder.encode(req.getId()));
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("UserIdCookie",URLEncoder.encode(req.getId()));
			cookie.setMaxAge(60*60*24*30);
			response.addCookie(cookie);
		}
		if(userInfo != null)
		session.setAttribute("userInfo", userInfo);
		return COPLETE_VIEW_CODE;
	}
	
	private static LoginRequest  mappingObject(HttpServletRequest request, HttpServletResponse response) {
		return new LoginRequest(request.getParameter("name"), request.getParameter("id"),
				request.getParameter("password"), checkAgree(request));
	}

	private static boolean checkAgree(HttpServletRequest request) {
		boolean userAgree = false;
		if(!(request.getParameter("rememberId") == null)) {
			userAgree = true;
		}
		return userAgree;
	}
}
