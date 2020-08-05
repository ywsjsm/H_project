package board.write.model;

import java.util.Map;

public class WriteRequest {

		private String title;
		private String content;
		private String imageName;
		private int category;
		
		public WriteRequest(String title, String content, String category, String imageName) {
			super();
			this.title = title;
			this.content = content;
			this.category = Integer.parseInt(category);
			this.imageName = imageName;
		}
		
		public int getCategory() {
			return category;
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
		
		public void validate(Map<String, Boolean> errors) {
			if(title.trim().isEmpty() || title == null) {
				errors.put("title", Boolean.TRUE);
			}
		}
}
