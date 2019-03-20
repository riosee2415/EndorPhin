package kr.or.ddit.employee.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class AnnualVo {

	String userId;
	Date annualDate;
	Date annualStart;
	Date annualEnd;
	String occurannual;
	String userDate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getAnnualDate() {
		return annualDate;
	}
	public void setAnnualDate(Date annualDate) {
		this.annualDate = annualDate;
	}
	public Date getAnnualStart() {
		return annualStart;
	}
	public void setAnnualStart(Date annualStart) {
		this.annualStart = annualStart;
	}
	public Date getAnnualEnd() {
		return annualEnd;
	}
	public void setAnnualEnd(Date annualEnd) {
		this.annualEnd = annualEnd;
	}
	public String getOccurannual() {
		return occurannual;
	}
	public void setOccurannual(String occurannual) {
		this.occurannual = occurannual;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	
	
}
