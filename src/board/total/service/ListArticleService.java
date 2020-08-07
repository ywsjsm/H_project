package board.total.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.dao.BoardDao;
import board.total.model.ArticlePage;
import board.total.model.totalRequest;
import jdbc.ConnectionProvider;

public class ListArticleService {
	private BoardDao boardDao = new BoardDao();
	private int size = 4;

	public ArticlePage getArticlePage(int pageNum, int cateNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			int total = boardDao.selectCateCount(conn, cateNum);
			
			List<totalRequest> content = boardDao.selectCateList(conn, (pageNum - 1) * size, size, cateNum);

			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
