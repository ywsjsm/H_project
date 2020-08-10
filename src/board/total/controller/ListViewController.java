package board.total.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.total.model.ArticlePage;
import board.total.service.ListArticleService;
import board.total.service.totalListArticleService;
import controller.Controller;

public class ListViewController implements Controller {

	private final static String VIEW_CODE= "/WEB-INF/view/list/total/totalList.jsp";
	private totalListArticleService totallistService = new totalListArticleService();
	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String ReqServletPath = request.getServletPath();
		String tokenPath = ReqServletPath.replace("/list/", "").replace(".do", "");
		
		String pageNoVal = request.getParameter("pageNo");
		ArticlePage articlePage = null;
		int pageNo = 1;
		int cateNum = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		switch (tokenPath) {
		case "animal":
			cateNum = 1;
			articlePage = listService.getArticlePage(pageNo, cateNum);
			break;
			
		case "music":
			cateNum = 2;
			articlePage = listService.getArticlePage(pageNo, cateNum);
			break;
			
		case "moters":
			cateNum = 3;
			articlePage = listService.getArticlePage(pageNo, cateNum);
			break;

		default:
			
			articlePage = totallistService.getArticlePage(pageNo);
			System.out.println("--------------------------------------------------");
			System.out.println("controller 에서 넘겨준 글 개수 "+articlePage.getContent().size());
			System.out.println("--------------------------------------------------");
			
			//articlePage.getContent().stream().forEach( content -> System.out.println(content.toString()));
			break;
		}
		
		request.setAttribute("ReqServletPath", ReqServletPath);
		request.setAttribute("articlePage", articlePage);
		
		return VIEW_CODE;
	}

}
