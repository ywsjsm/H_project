package board.total.model;

import java.util.Date;

public class totalRequest {
	private int boardNum;
	private String title;
	private String content;
	private String imageName;
	private String userId;
	private Date regdate;
	
	
	public totalRequest(int boardNum,String title, String content, String imageName,String userId, Date regdate) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.imageName = imageName;
		this.userId = userId;
		this.regdate = regdate;
	}
	
	public String getUserId() {
		return userId;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "totalRequest [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", imageName="
				+ imageName + ", userId=" + userId + ", regdate=" + regdate + "]";
	}
	
	
	
}
