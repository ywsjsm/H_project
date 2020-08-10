package board.write.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import board.dao.BoardDao;
import board.write.model.WriteRequest;
import board.write.service.WriteArticleService;
import board.write.service.WriteFileService;
import controller.Controller;
import jdbc.ConnectionProvider;
import user.model.User;

public class WriterBoardController implements Controller {
	private final static String TOTAL_VIEW_CODE="/WEB-INF/view/list/total/totalList.jsp";
	private final static String VIEW_CODE = "/WEB-INF/view/list/write/writeArticle.jsp";
	private WriteArticleService writeService = new WriteArticleService();
	private WriteFileService writeFile = new WriteFileService();
	private BoardDao dao = new BoardDao();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processPost(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}

	private String processGet(HttpServletRequest request, HttpServletResponse response) {
		return VIEW_CODE;
	}

	private String processPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Part filePart = request.getPart("fileName");
		String fileName = filePart.getSubmittedFileName();

		fileName = fileName == null ? "" : fileName;

		

		User user = (User) request.getSession(false).getAttribute("userInfo");
		WriteRequest WriteReq = createWriteRequest(request, fileName);

		writeService.write(WriteReq, user);
		//작성한 보드 넘버 가져와서 경로에 추가
		Connection con = ConnectionProvider.getConnection();
		int boardNo = dao.selectBoardNo(con);		
		
		if (!(fileName == null || fileName.isEmpty() || filePart.getSize() == 0)) {
			writeFile.write(filePart,WriteReq,user,boardNo);
		}
		
		return "redirect /list/total.do";
	}

	private WriteRequest createWriteRequest(HttpServletRequest req, String fileName) {
		return new WriteRequest(req.getParameter("title"), req.getParameter("content"), req.getParameter("category"), fileName);
	}
}
