package board.delete.service;

import java.sql.Connection;
import java.util.Map;

import board.dao.BoardDao;
import board.delete.model.DeleteArticleRequest;
import board.read.model.readBoardInfo;
import jdbc.ConnectionProvider;
import user.model.User;

//@Service
public class DeleteArticleService {
	
	private static DeleteArticleService service = new DeleteArticleService();
	
	public static DeleteArticleService getDeleteArticleService() {
		return service;
	}
	
	private DeleteArticleService() {
	}
	private BoardDao dao = new BoardDao();
	
	public Map<String, Boolean> deleteArticle(DeleteArticleRequest req, User user, Map<String,Boolean> errors){
		readBoardInfo boardInfo = null;
		try(Connection con = ConnectionProvider.getConnection()){
			boardInfo = dao.SelectbyBoardId(con, req.getBoardNo());			
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(!user.getUserId().equals(boardInfo.getUserId())) {
			errors.put("NotMatchUser",Boolean.TRUE);
		}		
		if(!user.getPassword().equals(req.getPassword())) {
			errors.put("passwordNotMatch",Boolean.TRUE);
		}
		if(!req.checkMatchPasswordToConfirmPassword()) {
			errors.put("passwordConfirmPasswordNotMatch",Boolean.TRUE);
		}
		
		errors = req.validate(errors);
		if(!errors.isEmpty()) {
			return errors;
		}else {			
			try(Connection con = ConnectionProvider.getConnection()){
				dao.deleteArticle(con, req);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		//딜리트 트랜젝션 후 errors 리턴
		return errors;
	}
	
}
