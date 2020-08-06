package user.repository.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;
import user.signup.exception.DuplicateMemberException;
import user.signup.model.SingnUpRequest;

//@Repository
public class UserDao {
	private static UserDao dao = new UserDao();
	
	private UserDao() {
	} 
	
	public static UserDao getUserDao() {
		return dao;
	}
	
//	SignUp
	public void Insert(SingnUpRequest req) throws DuplicateMemberException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionProvider.getConnection();
			final String sql ="INSERT INTO user (userId, userEmail, userName,userPassword) VALUES (?, ?, ?, ?)";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, req.getId());
				pstmt.setString(2, req.getEmail());
				pstmt.setString(3, req.getName());
				pstmt.setString(4, req.getPassword());
			
			 pstmt.executeUpdate();
			 con.commit();//캐치 와 파이널리 블록 순서는 정해져 있지않다.
		}catch(SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new DuplicateMemberException();
		}finally {
			JdbcUtil.close(con);
		}
	}

	public String selectOne(SingnUpRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnectionProvider.getConnection();
			final String sql ="SELECT userId FROM user WHERE userId = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getId());
			rs =	pstmt.executeQuery();
			if(rs.next()) {
				 return rs.getString(1);
			}
			 return null;
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e.printStackTrace();
			}
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con);
		}
	}
	
	// Login
	public User selectUserInfo(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			final String sql ="SELECT * FROM user WHERE userId = ?";
			con.setAutoCommit(false);
			SingnUpRequest SingnReq = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			User userInfo = null;
			if (rs.next()) {
				userInfo = mappingObject(rs);
			}
			return userInfo;
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e.printStackTrace();
			}
			e.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(rs,pstmt,con);
		}
	}
	
	// WithDrawal
	public void deleteUserInfo(Connection con, String id) throws SQLException{
		final String sql ="DELETE FROM user WHERE userId = ?";
		PreparedStatement pstmt = null;
		try{
			pstmt = con.prepareStatement(sql);//<<<<<요녀석 스테이트먼트에 이상있음.
			/*pstmt.setString(1, id);
			pstmt.executeUpdate();*/
		}catch(Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);			
		}
	}
	
	public User mappingObject(ResultSet rs) throws SQLException {// Result Set ->  Vo로 맵핑 리턴 타입은 인터페이스 < --- VO 구현
		return new User(rs.getString(1), rs.getString(2), 
				rs.getString(3), rs.getString(4), 
				rs.getTimestamp(5).toLocalDateTime());
	}
}
