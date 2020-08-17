package user.userInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.total.model.ArticlePage;
import board.total.service.ListArticleService;
import board.total.service.totalListArticleService;
import controller.Controller;
import user.model.User;

public class UserInfoController implements Controller {
	private totalListArticleService totallistService = new totalListArticleService();
	private ListArticleService listService = new ListArticleService();
	private final String VIEW_CODE = "userInfo.jsp";

	// 유저가 쓴 글, 유저가쓴 조회수 목록 6개 필요
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNoVal = request.getParameter("pageNo");
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("userInfo");
		ArticlePage articlePage = null;
		int pageNo = 1;
		int cateNum = 1;

		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}

		articlePage = totallistService.getArticlePageUserInfo(pageNo, userInfo.getUserNo());
		System.out.println(articlePage.toString());
		request.setAttribute("articlePage", articlePage);

		return VIEW_CODE;
	}

}
