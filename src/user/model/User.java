package user.model;

import java.time.LocalDateTime;

//VO
public class User {
	private String userId;
	private String userEmail;
	private String userName;
	private String password;
	private LocalDateTime regdate;
	private int userNo;
	
	public User(String userId, String userEmail, String userName, String password, LocalDateTime regdate, int userNo) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userName = userName;
		this.password = password;
		this.regdate = regdate;
		this.userNo = userNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public String getUserId() {
		return userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userEmail=" + userEmail + ", userName=" + userName + ", password="
				+ password + ", regdate=" + regdate + ", userNo=" + userNo + "]";
	}

	
	
	
	
	
}
