package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import board.model.BoardWriteRequest;

public class boardDao {

	public void insert(Connection conn, BoardWriteRequest req) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Board VALUES (NULL, ?, ?, ?, ?, ?, ?");
			pstmt.setString(1, req.getTitle());
			pstmt.setString(2, req.getContent());
			pstmt.setString(3, req.getImageName());
			pstmt.setTimestamp(4, toTimestamp(req.getRegdate()));
			pstmt.setString(5, req.getUserName());
			pstmt.setString(6, req.getUserId());
			
			pstmt.executeUpdate();
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
