package user.login.model;

import java.util.Map;

public class LoginRequest {
	
//	session 에 저장할 정보<<<< id, password name
	private String name;
	private String id;
	private String password;
	private boolean rememberId = false;
	
	
	public LoginRequest(String name, String id, String password, boolean rememberId) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.rememberId = rememberId;
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
	public boolean isRememberId() {
		return rememberId;
	}
	
	
	public boolean checkMatchingPassword(String inputPassword) {
		return this.password.equals(inputPassword);
	}

	
	public Map<String,Boolean > validate(Map<String, Boolean> errors){
		 if(id.trim().isEmpty() || id == null) {
			 errors.put("id", Boolean.TRUE);
		 }
		 if(password.trim().isEmpty() || password == null) {
			 errors.put("password", Boolean.TRUE);
		 }
		return errors;
	}
	

	@Override
	public String toString() {
		return "LoginRequest [name=" + name + ", id=" + id + ", password=" + password + ", remeberId=" + rememberId
				+ "]";
	}
	
	
}
