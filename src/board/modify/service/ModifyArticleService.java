package board.modify.service;

import java.sql.Connection;
import java.util.Map;

import board.dao.BoardDao;
import board.modify.model.ModifyArticleRequest;
import board.read.model.readBoardInfo;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;
import user.repository.dao.UserDao;

//@Service
public class ModifyArticleService {
	private static ModifyArticleService service = new ModifyArticleService();
	private BoardDao boardDao = new BoardDao();
	private UserDao userDao = UserDao.getUserDao();
	
	private ModifyArticleService() {
	}
	
	public static ModifyArticleService getModifyArticleService() {
		return service;
	}

	public Map<String, Boolean> modify(ModifyArticleRequest req, User user, Map<String, Boolean> errors) throws RuntimeException{
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			User userData = userDao.selectUserInfo(con, user.getUserId());
			con = ConnectionProvider.getConnection();
			readBoardInfo boardInfo = boardDao.SelectbyBoardId(con, req.getBoardNo());
			if(boardInfo == null) {
				errors.put("notFoundAticle", Boolean.TRUE);
			}
			if(userData == null) {
				errors.put("notFoundUser", Boolean.TRUE);
			}
			if(!(userData.getUserId().equals(user.getUserId()))){
				errors.put("notMatchId", Boolean.TRUE);
			}
			if(!(userData.getUserEmail().equals(user.getUserEmail()))) {
				errors.put("notMatchEmail", Boolean.TRUE);
			}
			if(!(userData.getUserName().equals(user.getUserName()))) {
				errors.put("notMatchName", Boolean.TRUE);
			}
				if(!errors.isEmpty()) {
					return errors;
				}
				con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);
			boardDao.update(con,req,user);
			con.commit();
		}catch(Exception e) {
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(con);
			return errors;
		}
		
	}
	
}
