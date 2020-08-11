package board.comments.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.comments.dao.CommentDao;
import board.comments.model.commentWriteRequest;
import jdbc.ConnectionProvider;
import user.model.User;

public class writeCommentService {
	CommentDao commentdao = new CommentDao();
	
	public void write(int boardno, commentWriteRequest req, User user) {
		try {
			Connection conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			commentdao.insert(conn, boardno, req, user);
			
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
