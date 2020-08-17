package json.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import board.dao.BoardDao;
import controller.Controller;
import user.model.User;

public class UserArticleController implements Controller {
	BoardDao dao = new BoardDao();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 제이손 형태로 줘야함, 리트 카운트 및 글 제목 주면 될듯
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("userInfo");
		Map<String, String> map = dao.selectArticleUserInfo(userInfo);
//		System.out.println("요청받은 Json 데이터 : " + map.toString());

		Gson gson = new Gson();

		String jsonData = gson.toJson(map);
//		System.out.println("========================");
//		System.out.println("보낸 데이터 Map : " + jsonData);
//		System.out.println("========================");
		return "Json " + jsonData;
	}
}
