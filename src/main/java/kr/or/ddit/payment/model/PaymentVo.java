package kr.or.ddit.payment.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class PaymentVo {
	
	String payCode;
	String userId;
	String totalWage;
	String totalSalary;
	String relate;
	Date payDy;
	
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTotalWage() {
		return totalWage;
	}
	public void setTotalWage(String totalWage) {
		this.totalWage = totalWage;
	}
	public String getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(String totalSalary) {
		this.totalSalary = totalSalary;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public Date getPayDy() {
		return payDy;
	}
	public void setPayDy(Date payDy) {
		this.payDy = payDy;
	}
	
	

}