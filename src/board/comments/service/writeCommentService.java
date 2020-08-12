package board.comments.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.comments.dao.CommentDao;
import board.comments.model.commentWriteRequest;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;

public class writeCommentService {
	CommentDao commentdao = new CommentDao();
	
	public void write(int boardno, commentWriteRequest req, User user) {
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			commentdao.insert(conn, boardno, req, user);
			
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
