package board.read.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BoardDao;
import board.read.exception.ArticleNotFoundException;
import board.read.model.readBoardInfo;
import jdbc.ConnectionProvider;

public class ReadBoardService {

	private BoardDao boardDao = new BoardDao();
	
	public readBoardInfo getArticle(int boardNo) {
		try (Connection conn = ConnectionProvider.getConnection()){
			
			boardDao.increaseReadCount(boardNo);
			readBoardInfo boardinfo = boardDao.SelectbyBoardId(conn, boardNo);
			if(boardinfo == null) {
				throw new ArticleNotFoundException();
			}
			
			System.out.println("======================================");
			System.out.println("조회수 증가 후 게시글 정보 "+boardinfo.toString());
			System.out.println("======================================");
			return boardinfo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
