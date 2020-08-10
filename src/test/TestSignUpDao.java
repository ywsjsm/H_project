package test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.repository.dao.UserDao;
import user.signup.model.SingnUpRequest;


@WebServlet("/TestSignUpDao")
public class TestSignUpDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestSignUpDao() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SingnUpRequest req = new SingnUpRequest(
			"아이디","이메일","홍길동","비밀번호","비밀번호 확인",true);
		
		UserDao dao = UserDao.getUserDao();
		
		try {
			dao.Insert(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
