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

public class MainLoginHandler implements Controller {
	private final static String VIEW_CODE = "/index.jsp";
	private static LoginService service = LoginService.getLoginService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return processLogin(request, response);
	}

	private String processLogin(HttpServletRequest request, HttpServletResponse response) {
		// 쿠키 정보 확인 후 있다면 추가, 및 DB 검사

		Cookie[] cookies = request.getCookies();

		for (Cookie coo : cookies) {
			if (coo.getName().equals("UserIdCookie")) {
				request.setAttribute("UserIdCookie", URLDecoder.decode(coo.getValue()));
			}
		}

//		System.out.println("메인 폼에서 포스트 요청 받음");
		LoginRequest req = mappingObject(request, response);
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("loginReq", req);
		request.setAttribute("errors", errors);

		errors = req.validate(errors);
		User userInfo = null;
		try {
			userInfo = service.login(req, errors);
		} catch (Exception e) {
			e.printStackTrace();
			return VIEW_CODE;
		}
		if (!errors.isEmpty()) {
			return VIEW_CODE;
		}
		HttpSession session = request.getSession();
		if (!req.isRememberId()) {
			Cookie cookie = new Cookie("UserIdCookie", URLEncoder.encode(req.getId()));
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("UserIdCookie", URLEncoder.encode(req.getId()));
			cookie.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(cookie);
		}
		if (userInfo != null)
			session.setAttribute("userInfo", userInfo);
		return "redirect ";

	}

	private static LoginRequest mappingObject(HttpServletRequest request, HttpServletResponse response) {
		return new LoginRequest(request.getParameter("name"), request.getParameter("formId"),
				request.getParameter("formPassword"), checkAgree(request));
	}

	private static boolean checkAgree(HttpServletRequest request) {
		boolean userAgree = false;
		if (!(request.getParameter("rememberId") == null)) {
			userAgree = true;
		}
		return userAgree;
	}
}
