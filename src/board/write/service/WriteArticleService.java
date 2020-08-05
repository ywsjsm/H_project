package board.write.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BoardDao;
import board.write.model.WriteRequest;
import board.write.model.tempUser;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class WriteArticleService {
	private BoardDao boardDao = new BoardDao();

	public void write(WriteRequest req, tempUser user) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			boardDao.insert(conn, req, user);
			
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		
	}

}
