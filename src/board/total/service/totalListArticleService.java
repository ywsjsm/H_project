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
//			System.out.println("--------------------------------------------------");
//			System.out.println("total가져온 글목록 수 : "+content.size());
//			System.out.println("--------------------------------------------------");
			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public ArticlePage getArticlePage(int pageNum, String find) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			int total = boardDao.selectCount(conn);
			
			List<totalRequest> content = boardDao.selectPartList(conn, (pageNum - 1) * size, size,find);
			System.out.println("--------------------------------------------------");
			System.out.println("검색어입력 후 가져온 글목록 수 : "+content.size());
			System.out.println("검색어입력 후 가져온 글 : ");
			content.forEach( c -> System.out.println(c.toString()));
			System.out.println("--------------------------------------------------");
			return new ArticlePage(total, pageNum, size, content);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
