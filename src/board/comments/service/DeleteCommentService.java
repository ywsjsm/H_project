package board.comments.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.comments.dao.CommentDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteCommentService {
	CommentDao commentdao = new CommentDao();
	
	public void delete(String replyNo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			commentdao.delete(conn, replyNo);
			conn.commit();
		}catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	public boolean checkPW(String inputPw, String replyNo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			String searchPw = commentdao.selectBypassword(conn, replyNo);
			
			if(inputPw.equals(searchPw)) {
				return true;
			}
		}catch (Exception e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
		
		return false;
	}
}
