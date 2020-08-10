package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {
	
	// 찾기
	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;

			if (rs.next()) {
				member = new Member(
						rs.getString("id"),
						rs.getString("name"),
						rs.getString("password"));
			}
			return member;
		} finally {
			JdbcUtil.close(rs, pstmt);
		}
	}

	// 삽입
	public void insert(Connection conn, Member mem) throws SQLException{
		try (PreparedStatement pstmt = conn.prepareStatement("INSERT INTO member VALUES (?, ?, ?, ?) ")) {
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			//pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
			pstmt.executeUpdate();
		}
	}
	
	// 업데이트
	public void update(Connection conn, Member member) throws SQLException {
		String sql = "UPDATE member SET name=?, password=? WHERE memberid=?";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			pstmt.executeUpdate();
		}
	}
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
}
