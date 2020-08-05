package user.login.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import user.login.model.User;

public class LoginService {

	private MemberDao memberDao = new MemberDao();

	public User login(String id, String password) {
		// try-with-resources
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) {
				throw new LoginFailException();
			}
			
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			
			return new User(member.getId(), member.getName());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
