package com.human.VO;

public class PageVO {
	private int startNo;//DB에 쓸것, 현재 페이지의 게시물 첫번째 순번
	private int end;	//DB에 쓸것, 현재 페이지의 게시물 마지막 순번
	private int pagecnt=5;	//화면에 보여질 페이지번호개수
	private int perPageNum;		//한페이지안에 게시글수
	private Integer page;//jsp단에서 null로 값이 올때 에러가 발생하지 않도록 Integer사용, 현재페이지
	private int totalCount;	//게시글총합
	private int endPage;	//끝페이지번호
	private int startPage;	//시작페이지번호
	private boolean prev;	//이전
	private boolean next;	//다음

	
	
	
	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPagecnt() {
		return pagecnt;
	}

	public void setPagecnt(int pagecnt) {
		this.pagecnt = pagecnt;
	}

	private void calcPage() {
		//끝페이지번호
		this.endPage=(int)(Math.ceil(page/(double)this.pagecnt)*this.pagecnt);
		//시작페이지번호
		this.startPage=(endPage-this.pagecnt)+1;	//끝페이지에서 화면에 보여질 페이지번호개수를 빼고 +1 
		//제일 마지막페이지가 끝페이지보다 작을경우 
		int tempEndpage=(int)(Math.ceil(totalCount/(double)this.getPerPageNum()));		// tempEndpage는 제일 마지막페이지
		if(endPage>tempEndpage) {
			endPage=tempEndpage;
		}
		this.prev = this.startPage != 1;//시작페이지 1보다 크면 무조건 이전 페이지가 있음. true
		this.next = this.endPage * this.perPageNum < this.totalCount;
		
		this.end=this.page*this.perPageNum;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();//totalCount 전제게시물개수가 있어야지 페이지계산을 할 수 있기 때문에
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getStartNo() {
		//DB쿼리에서 사용... 시작데이터번호 = (jsp클릭한 페이지번호-1)*페이지당 보여지는 개수
		startNo = (this.page - 1) * perPageNum+1;
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}
