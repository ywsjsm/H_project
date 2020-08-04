package user.signup.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.signup.model.SingnUpRequest;

//@Repository
public class SignUpDao {
	private static SignUpDao dao = new SignUpDao();
	
	private SignUpDao() {
	} 
	
	public static SignUpDao getSignUpDao() {
		return dao;
	}
	
	public void Insert(SingnUpRequest req) throws SQLException {
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
			 con.commit();
		}catch(Exception e) {
			e.printStackTrace();
				con.rollback();
		}finally {
			JdbcUtil.close(con);
		}
	}
	
	public void mappingObject(ResultSet rs) {
		
	}
}
