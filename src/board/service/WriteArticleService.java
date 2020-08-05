package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BoardDao;
import board.model.BoardWriteRequest;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class WriteArticleService {
	private BoardDao boardDao = new BoardDao();

	public void write(BoardWriteRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			boardDao.insert(conn, req);
			
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		
	}

}
