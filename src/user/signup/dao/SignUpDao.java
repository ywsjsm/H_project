package user.signup.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Result;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.model.Member;
import user.signup.exception.DuplicateMemberException;
import user.signup.model.SingnUpRequest;

//@Repository
public class SignUpDao {
	private static SignUpDao dao = new SignUpDao();
	
	private SignUpDao() {
	} 
	
	public static SignUpDao getSignUpDao() {
		return dao;
	}
	
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
	
	public void mappingObject(ResultSet rs) {
		
	}
	
	public SingnUpRequest selectUserInfo(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			final String sql ="SELECT * FROM user WHERE userId = ?";
			con.setAutoCommit(false);
			SingnUpRequest SingnReq = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				SingnReq = new SingnUpRequest(
						rs.getString("memberid"),
						rs.getString("name"),
						rs.getString("password"));
			}
			return SingnReq;
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
}
