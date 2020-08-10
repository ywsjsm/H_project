package board.comments.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.comments.dao.CommentDao;
import board.comments.model.CommentInfo;
import board.comments.model.CommentPage;
import jdbc.ConnectionProvider;

public class ReadCommentService {
	CommentDao commentdao = new CommentDao();
	private int size = 5;
	
	public CommentPage getCommentPage(int contPageNum, int boardno) {
		try {
			Connection conn = ConnectionProvider.getConnection();
	
			int total = commentdao.selectCount(conn, boardno);
			
			List<CommentInfo> comment_content = commentdao.selectList(conn, boardno, (contPageNum - 1) * size, size);
			
			return new CommentPage(total, contPageNum, size, comment_content);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
