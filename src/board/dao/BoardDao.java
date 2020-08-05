package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import board.write.model.WriteRequest;
import board.write.model.tempUser;

public class BoardDao {

	public void insert(Connection conn, WriteRequest req, tempUser user) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Board (title, content, imageName, userName, userId) VALUES (?, ?, ?, ?, ?)");
			pstmt.setString(1, req.getTitle());
			pstmt.setString(2, req.getContent());
			pstmt.setString(3, req.getImageName());
			pstmt.setString(4, user.getId());	//req.getUserName()
			pstmt.setString(5, user.getId());	// req.getUserId()
			
			pstmt.executeUpdate();
			
			pstmt.close();
	}
}
