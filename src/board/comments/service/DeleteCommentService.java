package board.comments.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.comments.dao.CommentDao;
import jdbc.ConnectionProvider;

public class DeleteCommentService {
	CommentDao commentdao = new CommentDao();
	
	public void delete(String replyNo) {
		try {
			Connection conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			commentdao.delete(conn, replyNo);
			conn.commit();
		}catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public boolean checkPW(String inputPw, String replyNo) {
		try {
			Connection conn = ConnectionProvider.getConnection();
			String searchPw = commentdao.selectBypassword(conn, replyNo);
			
			if(inputPw.equals(searchPw)) {
				return true;
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		return false;
	}
}
