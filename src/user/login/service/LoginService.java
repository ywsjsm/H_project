package user.login.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import jdbc.ConnectionProvider;
import user.login.model.LoginRequest;
import user.model.User;
import user.repository.dao.UserDao;

//@Service
public class LoginService {
	private static	LoginService service = new LoginService();
	private static UserDao dao = UserDao.getUserDao();
	
	private LoginService() {
	}
	
	public static LoginService getLoginService() {
		return service;
	}
	
	public User login(LoginRequest req, Map<String, Boolean> errors) throws RuntimeException {
		
		try(Connection con = ConnectionProvider.getConnection() ){
			User user = dao.selectUserInfo(con, req.getId());
			if(user == null) {
				errors.put("memberNotFound", Boolean.TRUE);
				return null;
			}
			if(!(req.checkMatchingPassword(user.getPassword()))) {
				errors.put("passwordNotMatch", Boolean.TRUE);
				return null;
			}
			return user;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
//	1. dao 에서 탐색, 입력값 비교, 검증, 서비스 실행


}
