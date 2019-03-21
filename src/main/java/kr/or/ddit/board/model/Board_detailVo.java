package kr.or.ddit.board.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class Board_detailVo {	//게시글
	
	String boardNo;				//게시글 번호
	String title;				//제목
	String contents;			//내용
	Date postDate;				//작성일시
	String boardTypeCode;		//게시판 분류 코드
	String userId;				//작성자
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getBoardTypeCode() {
		return boardTypeCode;
	}
	public void setBoardTypeCode(String boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}
