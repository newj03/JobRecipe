package  com.jobrecipe.advertisement.vo;

public class Paging {
	
	private int page; //현재 페이지
	private int perPageNum; //페이지 당 표시할 글의 개수
	private int rowStart;
	private int rowEnd;
	
	public Paging() { //理쒖큹 寃뚯떆�뙋 湲곕낯媛� 
		this.page = 1;
		this.perPageNum = 10; //蹂댁뿬以� 寃뚯떆湲� 媛��닔
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}
	

