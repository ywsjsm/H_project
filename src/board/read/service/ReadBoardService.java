package board.read.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BoardDao;
import board.read.exception.ArticleNotFoundException;
import board.read.model.readBoardInfo;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class ReadBoardService {

	private BoardDao boardDao = new BoardDao();
	
	public readBoardInfo getArticle(int boardNo) {
		Connection conn = null;
		
		try{
			conn = ConnectionProvider.getConnection();
			readBoardInfo boardinfo = boardDao.SelectbyBoardId(conn, boardNo);
			
			if(boardinfo == null) {
				throw new ArticleNotFoundException();
			}
			
			return boardinfo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
