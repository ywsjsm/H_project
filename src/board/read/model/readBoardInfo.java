package board.read.model;

import java.time.LocalDateTime;

public class readBoardInfo {
	
	private int boardNo;
	private String title;
	private String content;
	private int categoryNo;
	private String imageName;
	private String userName;
	private String userId;
	private LocalDateTime regdate;
	private int userNo;
	
	public readBoardInfo(int boardNo, String title, String content, int categoryNo, String imageName, String userName,
			String userId, LocalDateTime regdate, int userNo) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.imageName = imageName;
		this.userName = userName;
		this.userId = userId;
		this.regdate = regdate;
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public String getImageName() {
		return imageName;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserId() {
		return userId;
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public int getUserNo() {
		return userNo;
	}
	
	
	
	
}
