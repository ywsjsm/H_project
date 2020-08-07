package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import board.read.model.readBoardInfo;
import board.total.model.totalRequest;
import board.write.model.WriteRequest;
import jdbc.JdbcUtil;
import user.model.User;

public class BoardDao {

	public void insert(Connection conn, WriteRequest req, User user) throws SQLException {

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO Board (title, content, category_no, imageName, userName, userId, userNo) VALUES (?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, req.getTitle());
			pstmt.setString(2, req.getContent());
			pstmt.setInt(3, req.getCategory());
			pstmt.setString(4, req.getImageName());
			pstmt.setString(5, user.getUserName());
			pstmt.setString(6, user.getUserId());
			pstmt.setInt(7, user.getUserNo());

			pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public List<totalRequest> selectList(Connection conn, int startRow, int size) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			final String sql ="SELECT * FROM board where userNo Not in (select userNo from withdrawaluser) ORDER BY board_no DESC LIMIT ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);

			rs = pstmt.executeQuery();
			List<totalRequest> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertTotalRequest(rs));
			}
			return result;

		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	private totalRequest convertTotalRequest(ResultSet rs) throws SQLException {
		return new totalRequest(rs.getInt(1), rs.getString("title"), rs.getString("content"), rs.getString("imageName"),
				rs.getString(7), toDate(rs.getTimestamp("regdate")));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM board ");
			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}

	public readBoardInfo SelectbyBoardId(Connection conn, int boardNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = conn.prepareStatement("select * from board where board_no=?");
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();

			readBoardInfo boardinfo = null;
			if (rs.next()) {
				boardinfo = convertToBoardInfo(rs);
			}
			return boardinfo;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	private readBoardInfo convertToBoardInfo(ResultSet rs) throws SQLException {
		return new readBoardInfo(rs.getString("title"), rs.getString("content"), rs.getString("imageName"));
	}
}
