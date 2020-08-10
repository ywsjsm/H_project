package board.comments.model;

public class CommentInfo {
	private int reply_no;
	private int board_no;
	private String userid;
	private String content;
	
	public CommentInfo(int reply_no, int board_no, String userid, String content) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.userid = userid;
		this.content = content;
	}

	public int getReply_no() {
		return reply_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public String getUserid() {
		return userid;
	}

	public String getContent() {
		return content;
	}
	
}
