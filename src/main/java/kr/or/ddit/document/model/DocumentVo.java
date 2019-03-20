package kr.or.ddit.document.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class DocumentVo {
	
	String documentNumber;
	String title;
	String preservation;
	Date presentDate;
	String contents;
	String tempSortation;
	String completeSortation;
	String presentUser;
	String presentDepartment;
	
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPreservation() {
		return preservation;
	}
	public void setPreservation(String preservation) {
		this.preservation = preservation;
	}
	public Date getPresentDate() {
		return presentDate;
	}
	public void setPresentDate(Date presentDate) {
		this.presentDate = presentDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTempSortation() {
		return tempSortation;
	}
	public void setTempSortation(String tempSortation) {
		this.tempSortation = tempSortation;
	}
	public String getCompleteSortation() {
		return completeSortation;
	}
	public void setCompleteSortation(String completeSortation) {
		this.completeSortation = completeSortation;
	}
	public String getPresentUser() {
		return presentUser;
	}
	public void setPresentUser(String presentUser) {
		this.presentUser = presentUser;
	}
	public String getPresentDepartment() {
		return presentDepartment;
	}
	public void setPresentDepartment(String presentDepartment) {
		this.presentDepartment = presentDepartment;
	}
	
	
	

}
