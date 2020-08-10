package board.delete.model;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//DTO
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DeleteArticleRequest {
 private String password;
 private String confirmPassword;
 private int boardNo;
 
 public Map<String, Boolean> validate(Map<String, Boolean> errors){
	 if(password==null || password.trim().isEmpty()) {
		 errors.put("password",Boolean.TRUE);
	 }
	 if(confirmPassword == null || confirmPassword.trim().isEmpty()) {
		 errors.put("confirmPassword",Boolean.TRUE);
	 }
	 
	 return errors;
 }
 
 public boolean checkMatchPasswordToConfirmPassword() {
	 return password.equals(confirmPassword);
 }
}
