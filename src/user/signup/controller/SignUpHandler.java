package user.signup.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import user.signup.exception.DuplicateMemberException;
import user.signup.model.SingnUpRequest;
import user.signup.service.SignUpService;

public class SignUpHandler implements Controller{
	
	private static SignUpService service  = SignUpService.getSignUpService();
	private final static String COPLETE_VIEW_CODE="/WEB-INF/view/signup/SignUpComplete.jsp";
 	private final static String VIEW_CODE= "/WEB-INF/view/signup/SignUp.jsp";
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processPost(request,response);
		}else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}
	
	private static String processGet(HttpServletRequest request, HttpServletResponse response){
		return VIEW_CODE;
	}
	
	private static String processPost(HttpServletRequest request, HttpServletResponse response) {
		SingnUpRequest req = mappingObject(request, response);
		System.out.println(req.toString());
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("req", req);
		errors = req.validate(errors);
		request.setAttribute("errors", errors);
		
		 try {
			service.signUp(req, errors);
		} catch (DuplicateMemberException e) {
			e.printStackTrace();
			return VIEW_CODE;
		}
		 if(!errors.isEmpty()) {
				return VIEW_CODE;
			}
		 response.setStatus(HttpServletResponse.SC_CREATED);
		 System.out.println("회원가입 완료 창으로 포워드");
		 return COPLETE_VIEW_CODE;
//		return "/WEB-INF/view/login/Login.jsp";
//		 return "redirect /login.do";
//		 return null;
	}
	
	private static SingnUpRequest  mappingObject(HttpServletRequest request, HttpServletResponse response) {
		return new SingnUpRequest(
				request.getParameter("email"), request.getParameter("name"),
				request.getParameter("id"), request.getParameter("password"),
				request.getParameter("confirmPassword"), checkAgree(request));
	}

	private static boolean checkAgree(HttpServletRequest request) {
		boolean userAgree = false;
		if(!(request.getParameter("agree") == null)) {
			userAgree = true;
		}
		return userAgree;
	}
}
