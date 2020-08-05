package board.total.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.total.model.ArticlePage;
import controller.Controller;

public class TotalListController implements Controller{

	private final static String VIEW_CODE= "/WEB-INF/view/list/total/totalList.jsp";
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		String pageNoVal = request.getParameter("pageNo");
//		int pageNo = 1;
//		
//		if (pageNoVal != null) {
//			pageNo = Integer.parseInt(pageNoVal);
//		}
//		
//		ArticlePage articlePage = listService.getArticlePage(pageNo);
//		request.setAttribute("articlePage", articlePage);
		
		return VIEW_CODE;
	}
	
	
}
