package user.signup.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import user.signup.dao.SignUpDao;
import user.signup.model.SingnUpRequest;

//@Service
public class SignUpService {
	private static SignUpService service = new SignUpService();
	private SignUpDao dao = SignUpDao.getSignUpDao();
	
	public static SignUpService getSignUpService() {
		return service;
	}
	
	private SignUpService() {
	}
	
	
	public void signUp(SingnUpRequest req) throws SQLException {
		String existUser = dao.selectOne(req);
		System.out.println(existUser);
		
		if(!(existUser == null)) {// 미통과
			
		}
			System.out.println("통과");
			dao.Insert(req);
		
	}
}
