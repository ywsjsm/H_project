package board.write.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import board.write.model.BoardWriteRequest;
import jdbc.JdbcUtil;

public class BoardDao {

	public void insert(Connection conn, BoardWriteRequest req) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Board (title, content, imageName, regdate, userName, userId) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, req.getTitle());
			pstmt.setString(2, req.getContent());
			pstmt.setString(3, req.getImageName());
			pstmt.setTimestamp(4, toTimestamp(req.getRegdate()));
			pstmt.setString(5, "윤우섭");	//req.getUserName()
			pstmt.setString(6, "yun123");	// req.getUserId()
			
			pstmt.executeUpdate();
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
