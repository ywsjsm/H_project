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
import jdbc.JdbcUtil;
import user.model.User;

public class CommentDao {

	public void insert(Connection conn, int boardno, commentWriteRequest req, User user) throws SQLException {

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO comment (Board_no, userId, content, userPw,user_no) VALUES (?, ?, ?, ?,?)");
			pstmt.setInt(1, boardno);
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, req.getContent());
			pstmt.setString(4, user.getPassword());
			pstmt.setInt(5, user.getUserNo());
			pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public List<CommentInfo> selectList(Connection conn, int boardno, int startRow, int size) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		final String sql = "SELECT * FROM comment where user_no Not in (select userNo from withdrawaluser) and board_no=? ORDER BY reply_no DESC LIMIT ?, ?";
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
		return new CommentInfo(rs.getInt(1), rs.getInt(2), rs.getString("userId"), rs.getString("content"),
				rs.getTimestamp("regdate").toLocalDateTime());
	}

	public int selectCount(Connection conn, int boardno) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(
					"SELECT count(*) FROM comment where (user_no Not in (select userNo from withdrawaluser)) and board_no= "
							+ boardno);// 추후 확인 요망.
			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public void delete(Connection conn, String replyNo) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("delete from comment where reply_no = ?");

			pstmt.setString(1, replyNo);
			pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public String selectBypassword(Connection conn, String replyNo) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		final String sql = "SELECT userPw FROM comment where reply_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyNo);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("userPw");
			}
			return "";

		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

}