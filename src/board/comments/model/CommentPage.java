package board.comments.model;

import java.util.List;

public class CommentPage {
	private int total;
	private int currentPage;
	private List<CommentInfo> comment_content;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public CommentPage(int total, int currentPage, int size, List<CommentInfo> comment_content) {
		this.total = total;
		this.currentPage = currentPage;
		this.comment_content = comment_content;
		
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			
			startPage = (currentPage-1) / 3 * 3 + 1;
			
			endPage = startPage + 2;
			endPage = Math.min(endPage, totalPages);			
			
		}
	}
	
	public int getTotal() {
		return total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public List<CommentInfo> getContent() {
		return comment_content;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	
}
