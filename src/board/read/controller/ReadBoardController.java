package board.read.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.comments.model.CommentPage;
import board.comments.service.ReadCommentService;
import board.read.exception.ArticleNotFoundException;
import board.read.model.readBoardInfo;
import board.read.service.ReadBoardService;
import controller.Controller;

public class ReadBoardController implements Controller {

	private final static String VIEW_CODE = "/WEB-INF/view/list/read/readAticle.jsp";
	private ReadBoardService boardservice = new ReadBoardService();
	private ReadCommentService readcommentservice = new ReadCommentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 게시글 번호
		String noVal = request.getParameter("no");
		int boardNum = Integer.parseInt(noVal);

		// 댓글 리스트 번호
		String pageNoVal = request.getParameter("compageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
			
		try {

			readBoardInfo boardInfo = boardservice.getArticle(boardNum);
			request.setAttribute("boardInfo", boardInfo);
			request.setAttribute("boardNo",boardNum);
			
			// 댓글 리스트
			CommentPage commentpage = readcommentservice.getCommentPage(pageNo, boardNum);
			request.setAttribute("CommentPage", commentpage);

			return VIEW_CODE;
		} catch (ArticleNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
}
