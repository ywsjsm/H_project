package board.read.model;

public class readBoardInfo {

	private String title;
	private String content;
	private String imageName;
	
	public readBoardInfo(String title, String content, String imageName) {
		super();
		this.title = title;
		this.content = content;
		this.imageName = imageName;
	}
	
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getImageName() {
		return imageName;
	}
	
	
}
