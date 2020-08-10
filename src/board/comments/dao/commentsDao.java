package board.comments.dao;

public class commentsDao {

	private int reply_no;
	private int Board_no;
	private String userId;
	private String content;
	
	public commentsDao(int reply_no, int board_no, String userId, String content) {
		super();
		this.reply_no = reply_no;
		Board_no = board_no;
		this.userId = userId;
		this.content = content;
	}

	public int getReply_no() {
		return reply_no;
	}

	public int getBoard_no() {
		return Board_no;
	}

	public String getUserId() {
		return userId;
	}

	public String getContent() {
		return content;
	}
	
}
