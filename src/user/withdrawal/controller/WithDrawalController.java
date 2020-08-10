package user.withdrawal.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import user.model.User;
import user.withdrawal.model.WithDrawalRequest;
import user.withdrawal.service.WithDrawalService;

public class WithDrawalController implements Controller{
	private WithDrawalService service = WithDrawalService.getWithDrawalService();
	
	private final static String VIEW_CODE= "/WEB-INF/view/withdrawal/withDrawal.jsp";
	private final static String VIEW_REDIRECT ="/WEB-INF/view/withdrawal/withDrawalComplete.jsp";
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(request.getMethod());
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
		System.out.println("계정삭제 폼에서 Post 요청 수렴");
		User user = null;
		if(null != request.getSession().getAttribute("userInfo")) {			
			user = (User)request.getSession().getAttribute("userInfo");
		}
		System.out.println(user);
		WithDrawalRequest req = mappingObject(request);
		
		System.out.println("계정삭제 Post 요청 :" +user.toString());
		System.out.println();
		System.out.println("입력 정보 :"+req.toString());
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		errors = req.validate(errors);
		//비즈니스 로직 실행  /  검증 +트렌젝션
		try {
		errors = service.service(errors, user, req);
		}catch(Exception e) {
			e.printStackTrace();
			return VIEW_CODE;
		}
		
		// errors 가 비어있는지 여부로 분기 검사
		if(!errors.isEmpty()) {
			return VIEW_CODE;
		}
		  return VIEW_REDIRECT;
	}
	
	private WithDrawalRequest mappingObject(HttpServletRequest request) {
		return new WithDrawalRequest(request.getParameter("id"),request.getParameter("name"),
				request.getParameter("email"),
				request.getParameter("password"), request.getParameter("confirmPassword"), 
				checkAgree(request));
	}
	
	private static boolean checkAgree(HttpServletRequest request) {
		boolean userAgree = false;
		if(!(request.getParameter("agree") == null)) {
			userAgree = true;
		}
		return userAgree;
	}
}
