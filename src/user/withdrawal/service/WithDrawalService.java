package user.withdrawal.service;

import java.sql.Connection;
import java.util.Map;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import user.model.User;
import user.repository.dao.UserDao;
import user.withdrawal.model.WithDrawalRequest;

//@Service
public class WithDrawalService {

	private static WithDrawalService service = new WithDrawalService();
	private UserDao dao = UserDao.getUserDao();
	
	private WithDrawalService() {
	}
	
	public static WithDrawalService getWithDrawalService() throws RuntimeException{
		return service;
	}
	// 트랜젝션 및 비밀번호가 맞는지 검증
	public Map<String,Boolean>  service(Map<String,Boolean> errors, User userInfo, WithDrawalRequest req) {
		Connection con  = null;
		try {		
			con = ConnectionProvider.getConnection();
			User userData = dao.selectUserInfo(con, userInfo.getUserId());
			if(!(userData.getUserEmail().equals(req.getEmail())) || !(userData.getUserName().equals(req.getName()))
					||!(userData.getUserId().equals(req.getId())) ) {
				errors.put("userNotMatching", Boolean.TRUE);
			}else{			
				if(!userData.getPassword().equals(req.getPassword())) {
					errors.put("passwordNotMatching", Boolean.TRUE);
				}
				if(!req.CheckMatchingPassword()) {
					errors.put("confirmPasswordNotMatching", Boolean.TRUE);
				}
				if(!req.isAgree()) {
					errors.put("ConditionNotAgree", Boolean.TRUE);
				}
			}
			if(errors.isEmpty()) {
				//삭제 메서드
				dao.deleteUserInfo(con,req.getId());
			}
			return errors;			
		}catch(Exception e) {
			e.printStackTrace();
			return errors;	
		}finally {
			JdbcUtil.close(con);
		}
	}
	
}
