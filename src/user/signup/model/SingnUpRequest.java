package user.signup.model;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.regex.Pattern;

//CommandObject
public class SingnUpRequest {
	
	private final String regEx = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";

	
	private String email;
	private String name;
	private String id;
	private String password;
	private String confirmPassword;
	private boolean agree = false;
	private LocalDateTime regDate;

	public SingnUpRequest(String name, String id, String password) {
		this.name = name;
		this.id = id;
		this.password = password;
	}
	
	public SingnUpRequest(String email, String name, String id, String password, String confirmPassword, boolean agree) {
		this.email = email;
		this.name = name;
		this.id = id;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.agree = agree;
	}
	
	public LocalDateTime getRegDate() {
		return regDate;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}
	
	public boolean checkMatchingPassword() {
		return this.password.equals(confirmPassword);
	}
	
	public boolean checkMatchingPassword(String pw) {
		return this.password.equals(pw);
	}
	
// 객체 검증
	public Map<String, Boolean> validate(Map<String, Boolean> errors){
		if(email.trim().isEmpty() || email == null) {
			errors.put("email", Boolean.TRUE);
		}else {
			if(!Pattern.matches(regEx, email)) {
				errors.put("emailnotmatch", Boolean.TRUE);
			}
		}
		if(id.trim().isEmpty() | id == null) {
			errors.put("id",Boolean.TRUE);
		}
		if(name.trim().isEmpty() || name == null) {
			errors.put("name", Boolean.TRUE);
		}
		if(password.trim().isEmpty() || password == null) {
			errors.put("password", Boolean.TRUE);
		}
		if(confirmPassword.trim().isEmpty() || confirmPassword == null) {
			errors.put("confirmPassword", Boolean.TRUE);
		}
		if(agree == false) {
			errors.put("agree", Boolean.TRUE);
		}
		return errors;
	}

	@Override
	public String toString() {
		return "SingnUpRequest [ email=" + email + ", name=" + name + ", id=" + id + ", password="
				+ password + ", confirmPassword=" + confirmPassword + ", agree=" + agree + ", regDate=" + regDate + "]";
	}
	
	
	
	
}
