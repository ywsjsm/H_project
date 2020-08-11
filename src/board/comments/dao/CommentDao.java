package board.comments.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.comments.model.CommentInfo;
import board.comments.model.commentWriteRequest;
import board.total.model.totalRequest;
import jdbc.JdbcUtil;
import user.model.User;

public class CommentDao {

	public void insert(Connection conn, int boardno, commentWriteRequest req, User user) throws SQLException {

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("INSERT INTO comment (Board_no, userId, content) VALUES (?, ?, ?)");
			pstmt.setInt(1, boardno);
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, req.getContent());
			pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public List<CommentInfo> selectList(Connection conn, int boardno, int startRow, int size) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		final String sql = "SELECT * FROM comment where board_no=? ORDER BY reply_no DESC LIMIT ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);

			rs = pstmt.executeQuery();
			List<CommentInfo> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertCommentInfo(rs));
			}
			return result;

		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	private CommentInfo convertCommentInfo(ResultSet rs) throws SQLException {
		return new CommentInfo(rs.getInt(1), rs.getInt(2), rs.getString("userId"), rs.getString("content"));
	}
	
	public int selectCount(Connection conn, int boardno) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM comment where board_no= "+boardno);
			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}
	
	public void delete(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("delete from comment where reply_no = ?");
			
			pstmt.setString(1, "1");
			pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

}