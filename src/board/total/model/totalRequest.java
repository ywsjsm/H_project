package board.total.model;

import java.util.Date;

public class totalRequest {
	private String title;
	private String content;
	private String imageName;
	private Date regdate;
	
	
	public totalRequest(String title, String content, String imageName, Date regdate) {
		super();
		this.title = title;
		this.content = content;
		this.imageName = imageName;
		this.regdate = regdate;
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
	
	
}
