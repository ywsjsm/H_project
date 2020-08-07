package board.modify.model;

import java.util.Map;

//Command Object
public class ModifyArticleRequest {
	private int boardNo;
	private String title;
	private String content;
	private String fileName;

	public ModifyArticleRequest(int boardNo,String title, String content, String fileName) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
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
	
	public Map<String, Boolean> validate (Map<String,Boolean> errors){
		if(title.trim().isEmpty() || title == null) {
			errors.put("title", Boolean.TRUE);
		}
		return errors;
	}
	@Override
	public String toString() {
		return "ModifyArticleRequest [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", fileName="
				+ fileName + "]";
	}
	
	

}
