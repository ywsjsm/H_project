package user.repository.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;
import user.signup.exception.DuplicateMemberException;
import user.signup.model.SingnUpRequest;
import user.withdrawal.model.WithDrawalRequest;

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
			JdbcUtil.close(rs,pstmt,con);//커넥션 상태 확인 꼭.
		}
	}
	
	// WithDrawal & Insert userInfomation To Withdrawal Table :)
	public void deleteUserInfo(Connection con, String id) throws RuntimeException{
		
		PreparedStatement pstmt = null;
		try{
			final String sql ="DELETE FROM user WHERE userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			JdbcUtil.rollback(con);
				throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public void insertWithDrawal(User userInfo, Connection con) {
		PreparedStatement pstmt = null;
		try {
			final String sql = "INSERT INTO withdrawaluser(userNo,userId,regdate) VALUES (?,?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userInfo.getUserNo());
			pstmt.setString(2, userInfo.getUserId());
			pstmt.setTimestamp(3, Timestamp.valueOf(userInfo.getRegdate()));
			pstmt.executeUpdate();
			con.commit();
			System.out.println("회원 탈퇴 회원 정보 중: "+userInfo.getUserNo()+" : "+userInfo.getUserId()+" : "+userInfo.getRegdate()+"가 보관 조치 됨");
		}catch(SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	//
	
	public User mappingObject(ResultSet rs) throws SQLException {// Result Set ->  Vo로 맵핑 리턴 타입은 인터페이스 < --- VO 구현
		return new User(rs.getString(1), rs.getString(2), 
				rs.getString(3), rs.getString(4), 
				rs.getTimestamp(5).toLocalDateTime(),rs.getInt(6));
	}
}
