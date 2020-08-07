package board.write.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import board.write.model.WriteRequest;
import board.write.service.WriteArticleService;
import board.write.service.WriteFileService;
import controller.Controller;
import user.model.User;

public class WriterBoardController implements Controller {
	private final static String VIEW_CODE = "/WEB-INF/view/list/write/writeArticle.jsp";
	private WriteArticleService writeService = new WriteArticleService();
	private WriteFileService writeFile = new WriteFileService();

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

		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		User user = (User) request.getSession(false).getAttribute("userInfo");
		WriteRequest WriteReq = createWriteRequest(request, fileName);
		WriteReq.validate(errors);

		if (!errors.isEmpty()) {
			return VIEW_CODE;
		}

		writeService.write(WriteReq, user);
		
		if (!(fileName == null || fileName.isEmpty() || filePart.getSize() == 0)) {
			writeFile.write(filePart);
		}

		return "/WEB-INF/view/list/total/totalList.jsp";//<<<나중에 요청 날라오게 끔 수정해야함
	}

	private WriteRequest createWriteRequest(HttpServletRequest req, String fileName) {

		return new WriteRequest(req.getParameter("title"), req.getParameter("content"), req.getParameter("category"), fileName);
	}
}
