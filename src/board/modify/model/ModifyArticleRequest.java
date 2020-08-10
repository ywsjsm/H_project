package board.modify.model;

import java.util.Map;

//Command Object
public class ModifyArticleRequest {
	private int boardNo;
	private int categoryNo;
	private String title;
	private String content;
	private String fileName;

	public ModifyArticleRequest(int boardNo,int categoryNo,String title, String content, String fileName) {
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
	}
	
	public int getCategoryNo() {
		return categoryNo;
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

	public String getFileName() {
		return fileName;
	}

	@Override
	public String toString() {
		return "ModifyArticleRequest [boardNo=" + boardNo + ", categoryNo=" + categoryNo + ", title=" + title
				+ ", content=" + content + ", fileName=" + fileName + "]";
	}
	

	
	
	

}
