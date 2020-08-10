package board.total.model;

import java.util.List;

public class ArticlePage {
	private int total;
	private int currentPage;
	private List<totalRequest> content;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public ArticlePage(int total, int currentPage, int size, List<totalRequest> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
//			System.out.println("totalPages : "+totalPages+" / total ");
			System.out.println("--------------------------------------------------");
			System.out.println("total 값  : "+ total);
			System.out.println("--------------------------------------------------");
			if (total % size > 0) {
				totalPages++;
			}
			
			startPage = (currentPage-1) / 5 * 5 + 1;
			
			endPage = startPage + 4;
			endPage = Math.min(endPage, totalPages);
			System.out.println("--------------------------------------------------");
			System.out.println("마지막 페이지네이션 번호 : "+ endPage);
			System.out.println("--------------------------------------------------");
			
			
		}
	}
	
	public int getTotal() {
		return total;
	}
	
	public boolean hasNoArticles() {
		return total == 0;
	}
	
	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	public List<totalRequest> getContent() {
		return content;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
}
