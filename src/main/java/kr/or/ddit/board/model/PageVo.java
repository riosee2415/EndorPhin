package kr.or.ddit.board.model;

public class PageVo {
	
	private String page;
	private String pageSize;
	private String boardTypeCode;
	public String getPage() {
		return page == null ? "1" : page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPageSize() {
		return pageSize == null ? "10" : pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getBoardTypeCode() {
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", boardTypeCode=" + boardTypeCode + "]";
	}
	
	
	
}
