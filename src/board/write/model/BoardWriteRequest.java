package board.write.model;

import java.util.Date;

public class BoardWriteRequest {

		private int board_no;
		private String title;
		private String content;
		private String imageName;
		private String userName;
		private String userId;
		private Date regdate;
		
		public BoardWriteRequest(String title, String content, String imageName, Date regdate) {
			this.title = title;
			this.content = content;
			this.imageName = imageName;
			this.regdate = regdate;
		}
		
		public int getBoard_no() {
			return board_no;
		}
		public void setBoard_no(int board_no) {
			this.board_no = board_no;
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
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		
		
}
