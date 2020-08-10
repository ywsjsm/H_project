package test;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import user.model.User;
import user.repository.dao.UserDao;


@WebServlet("/test/userdao")
public class TestUserDao extends HttpServlet{
	
	private UserDao dao = UserDao.getUserDao();

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			try(Connection con = ConnectionProvider.getConnection()){
				User user = dao.selectUserInfo(con, "doli0413");
				System.out.println(user.toString());
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
}
