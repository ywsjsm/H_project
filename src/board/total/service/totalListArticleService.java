package board.total.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.dao.BoardDao;
import board.total.model.ArticlePage;
import board.total.model.totalRequest;
import jdbc.ConnectionProvider;

public class totalListArticleService {
	private BoardDao boardDao = new BoardDao();
	private int size = 4;

	public ArticlePage getArticlePage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			int total = boardDao.selectCount(conn);
			
			List<totalRequest> content = boardDao.selectList(conn, (pageNum - 1) * size, size);

			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
