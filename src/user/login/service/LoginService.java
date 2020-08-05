package user.login.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import user.login.exception.LoginFailException;
import user.login.model.User;
import user.signup.dao.SignUpDao;
import user.signup.model.SingnUpRequest;

public class LoginService {

	private SignUpDao loginDao = SignUpDao.getSignUpDao();

	public User login(String id, String password) {
		// try-with-resources
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			SingnUpRequest userinfo = loginDao.selectUserInfo(conn, id);
			
			if (userinfo == null) {
				throw new LoginFailException();
			}
			
			if (!userinfo.checkMatchingPassword(password)) {
				throw new LoginFailException();
			}
			
			return new User(userinfo.getId(), userinfo.getName());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
