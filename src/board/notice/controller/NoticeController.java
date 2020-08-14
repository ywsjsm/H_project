package board.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class NoticeController implements Controller{
	
	private final static String VIEW_CODE ="/notice.jsp";
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return VIEW_CODE;
	}
}
