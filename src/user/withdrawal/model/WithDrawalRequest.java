package user.withdrawal.model;

import java.util.Map;

//CommandObject
public class WithDrawalRequest {
	private String id;
	private String name;
	private String email;
	private String password;
	private String confirmPassword;
	private boolean agree;
	
	public WithDrawalRequest(String id, String name, String email, String password, String confirmPassword, boolean agree) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.agree = agree;
	}
	
	public String getEmail() {
		return email;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public boolean isAgree() {
		return agree;
	}
	
	public boolean CheckMatchingPassword() {
		return this.password.equals(this.confirmPassword);
	}
	
	public Map<String, Boolean> validate(Map<String, Boolean> errors){
		
		if(password.trim().isEmpty() || password == null) {
			errors.put("password",Boolean.TRUE);
		}
		if(confirmPassword.trim().isEmpty() || confirmPassword == null) {
			errors.put("confirmPassword", Boolean.TRUE);
		}
		return errors;
	}

	@Override
	public String toString() {
		return "WithDrawalRequest [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", confirmPassword=" + confirmPassword + ", agree=" + agree + "]";
	}
	
	
}
