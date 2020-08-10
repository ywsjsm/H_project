package board.comments.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.comments.model.commentWriteRequest;
import board.comments.service.writeCommentService;
import controller.Controller;
import user.model.User;

public class writeCommentController implements Controller{
	
	private writeCommentService writeService = new writeCommentService();
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String strNo = request.getParameter("no");
		int boardno = Integer.parseInt(strNo);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userInfo");
		
		writeService.write(boardno, createWriteRequest(request), user);
		response.sendRedirect(request.getContextPath()+"/read.do?no="+boardno);
		return null;
	}
	
	private commentWriteRequest createWriteRequest(HttpServletRequest req) {
		return new commentWriteRequest(req.getParameter("content"));
	}

}
