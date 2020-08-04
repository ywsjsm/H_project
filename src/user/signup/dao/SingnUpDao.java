package user.signup.dao;

import java.sql.Connection;

//@Repository
public class SingnUpDao {
	SingnUpDao dao = new SingnUpDao();
	
	private SingnUpDao() {
	} 
	
	public SingnUpDao getSignUpDao() {
		return dao;
	}
	
	public void Insert() {
		Connection con = null;
		
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
