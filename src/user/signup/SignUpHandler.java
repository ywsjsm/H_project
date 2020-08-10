package user.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class SignUpHandler implements Controller{
	
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
		return null;
	}
}
