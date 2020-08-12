package board.write.service;

import java.sql.Connection;

import board.dao.BoardDao;
import board.write.model.WriteRequest;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;

public class WriteArticleService {
	private BoardDao boardDao = new BoardDao();

	public void write(WriteRequest req, User user) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			boardDao.insert(conn, req, user);
			
			conn.commit();
			
		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
		
	}

}
