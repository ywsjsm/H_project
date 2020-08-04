package user.signup.service;

import java.util.Map;

import user.signup.dao.SignUpDao;
import user.signup.exception.DuplicateMemberException;
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
	
	
	public void signUp(SingnUpRequest req, Map<String, Boolean> errors) throws DuplicateMemberException {
		String existUser = dao.selectOne(req);
//		System.out.println(existUser);
		
		if(!(existUser == null)) {// 미통과
			errors.put("dulicateEmail", Boolean.TRUE);
		}
		if(!req.checkMatchingPassword()) {
			errors.put("confirmPasswordNotMatching", Boolean.TRUE);
		}
		
		if(errors.isEmpty()){			
			try {
				dao.Insert(req);
			}catch(RuntimeException e) {
				throw new DuplicateMemberException(e);
			}
		}
	}
}
