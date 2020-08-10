package board.comments.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

//	public List<CommentInfo> selectList(Connection conn, int boardno) throws SQLException {
//
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		final String sql = "SELECT * FROM board where userNo Not in (select userNo from withdrawaluser) ORDER BY board_no DESC LIMIT ?, ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, size);
//
//			rs = pstmt.executeQuery();
//			List<totalRequest> result = new ArrayList<>();
//			while (rs.next()) {
//				result.add(convertTotalRequest(rs));
//			}
//			return result;
//
//		} finally {
//			JdbcUtil.close(rs, pstmt);
//		}
//	}
//
//	private totalRequest convertTotalRequest(ResultSet rs) throws SQLException {
//		return new totalRequest(rs.getInt(1), rs.getString("title"), rs.getString("content"), rs.getString("imageName"),
//				rs.getString(7), toDate(rs.getTimestamp("regdate")));
//	}

}
