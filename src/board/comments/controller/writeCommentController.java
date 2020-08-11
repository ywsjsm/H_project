package board.comments.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.comments.model.CommentInfo;
import board.comments.model.commentWriteRequest;
import board.comments.service.DeleteCommentService;
import board.comments.service.writeCommentService;
import controller.Controller;
import user.model.User;

public class writeCommentController implements Controller {

	private writeCommentService writeService = new writeCommentService();
	private DeleteCommentService deleteService = new DeleteCommentService();
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String ReqServletPath = request.getServletPath();
		String tokenPath = ReqServletPath.replace("/", "").replace(".do", "");
		System.out.println(tokenPath);

		String strNo = request.getParameter("no");
		int boardno = Integer.parseInt(strNo);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userInfo");

		switch (tokenPath) {
		case "delete":
			String CheckPW = request.getParameter("checkPW");
			String CommentNo = request.getParameter("commentNo");
			if(deleteService.checkPW(CheckPW, CommentNo)) {
				deleteService.delete(CommentNo);
				session.setAttribute("checkPw", true);
			}
			break;

		case "comments":
			writeService.write(boardno, createWriteRequest(request), user);
			break;
		}
		response.sendRedirect(request.getContextPath() + "/read.do?no=" + boardno);
		return null;
	}

	private commentWriteRequest createWriteRequest(HttpServletRequest req) {
		return new commentWriteRequest(req.getParameter("content"));
	}

}
