package board.selectPart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.total.model.ArticlePage;
import board.total.service.ListArticleService;
import board.total.service.totalListArticleService;
import controller.Controller;

//@Controller
public class SelectPartController implements Controller{
	private static final String VIEW_CODE ="/WEB-INF/view/list/total/totalList.jsp";
	private totalListArticleService totallistService = new totalListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("서칭 컨트롤러 Ajax 요청 수렴 : "+request.getParameter("find"));
		String ReqServletPath = request.getServletPath();
		String find = request.getParameter("find");
		ArticlePage articlePage = null;
		int pageNo = 1;
		
		articlePage = totallistService.getArticlePage(pageNo,find);
		System.out.println("--------------------------------------------------");
		System.out.println("controller 에서 넘겨준 글 개수 "+articlePage.getContent().size());
		System.out.println("--------------------------------------------------");
		request.setAttribute("ReqServletPath", ReqServletPath);
		request.setAttribute("articlePage", articlePage);
		
		return VIEW_CODE;
	}
}
