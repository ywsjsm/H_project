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

import board.delete.model.DeleteArticleRequest;
import board.modify.model.ModifyArticleRequest;
import board.read.model.readBoardInfo;
import board.total.model.totalRequest;
import board.write.model.WriteRequest;
import jdbc.JdbcUtil;
import user.model.User;

public class BoardDao {
	
	public void deleteArticle(Connection con, DeleteArticleRequest req) throws RuntimeException{
		final String sql ="DELETE FROM board WHERE board_no=?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, req.getBoardNo());
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
		
	
	public int selectBoardNo(Connection con) {
		ResultSet rs = null;
		try(Statement stmt = con.createStatement()){
			rs = stmt.executeQuery("select max(last_insert_id(board_no)) from board");
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

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
	
	public List<totalRequest> selectPartList(Connection conn, int startRow, int size, String find ) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			final String sql ="SELECT * FROM board where userNo Not in (select userNo from withdrawaluser) AND title LIKE ? ORDER BY board_no DESC LIMIT ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+find+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);

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
		return new totalRequest(rs.getInt(1), rs.getString("title"), rs.getString("content"),rs.getInt(4), rs.getString("imageName"),
				rs.getString(7), toDate(rs.getTimestamp("regdate")),rs.getInt(9));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM board where userNo Not in (select userNo from withdrawaluser) ORDER BY board_no DESC");
			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} finally {
			JdbcUtil.close(rs, stmt);
		}
	}
	
	public int selectCateCount(Connection conn, int cateNum) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM board where category_no = " + cateNum);
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
		return new readBoardInfo(
				rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),
				rs.getString(6),rs.getString(7),rs.getTimestamp(8).toLocalDateTime(),rs.getInt(9)
				);
	}
	
	public void SelectbyCategory(Connection conn, int CateNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from board where category_no = ?");
		pstmt.setInt(1, CateNo);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
		}
		
	}
	
	public List<totalRequest> selectCateList(Connection conn, int startRow, int size, int cateNum) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			final String sql ="SELECT * FROM board where userNo Not in (select userNo from withdrawaluser) AND category_no = ? ORDER BY board_no DESC LIMIT ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cateNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);

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

	public void update(Connection con, ModifyArticleRequest req, User user) throws RuntimeException{
		final String sql ="update board set category_no=?,title=?, content=?, imageName=? where board_no =?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			con.setAutoCommit(false);
			pstmt.setInt(1, req.getCategoryNo());
			pstmt.setString(2, req.getTitle());
			pstmt.setString(3, req.getContent());
			pstmt.setString(4, req.getFileName());
			pstmt.setInt(5, req.getBoardNo());
			pstmt.executeUpdate();
			con.commit();
		}catch(SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		}
	}
}
