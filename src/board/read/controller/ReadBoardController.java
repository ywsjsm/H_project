package board.read.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.read.exception.ArticleNotFoundException;
import board.read.model.readBoardInfo;
import board.read.service.ReadBoardService;
import controller.Controller;

public class ReadBoardController implements Controller {

	private final static String VIEW_CODE = "/WEB-INF/view/list/read/readAticle.jsp";
	private ReadBoardService boardservice = new ReadBoardService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String noVal = request.getParameter("no");
		int boardNum = Integer.parseInt(noVal);

		try {

			readBoardInfo boardInfo = boardservice.getArticle(boardNum);
			request.setAttribute("boardInfo", boardInfo);
			request.setAttribute("pageNo",boardNum);

			return VIEW_CODE;
		} catch (ArticleNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
}
