package kr.or.ddit.board.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author sanghoyun
 *
 */
public class Board_detailVo {	//게시글
	
	String boardNo;				//게시글 번호
	String title;				//제목
	String contents;			//내용
	String postDate;				//작성일시
	String boardTypeCode;		//게시판 분류 코드
	String userId;				//작성자
    private List<MultipartFile> uploadfile;

	
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
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
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
	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}
	@Override
	public String toString() {
		return "Board_detailVo [boardNo=" + boardNo + ", title=" + title + ", contents=" + contents + ", postDate="
				+ postDate + ", boardTypeCode=" + boardTypeCode + ", userId=" + userId + "]";
	}
	
	

}
