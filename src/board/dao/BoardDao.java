package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import board.write.model.WriteRequest;
import user.model.User;


public class BoardDao {

	public void insert(Connection conn, WriteRequest req, User user) throws SQLException {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO Board (title, content, category_no, imageName, userName, userId) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, req.getTitle());
			pstmt.setString(2, req.getContent());
			pstmt.setInt(3, req.getCategory());
			pstmt.setString(4, req.getImageName());
			pstmt.setString(5, user.getUserName());
			pstmt.setString(6, user.getUserId());
			
			pstmt.executeUpdate();
			
			pstmt.close();
	}
	
	public void select(Connection conn, String id) {
		
	}
}
