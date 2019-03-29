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
	String payDay;
	String positionname; // 직급명
	
	public PaymentVo() {
	}

	// 입력을 위한 생성자
	public PaymentVo(String userId, String payDay) {
		this.userId = userId;
		this.payDay = payDay;
	}
	
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getJoincompany() {
		return joincompany;
	}
	public void setJoincompany(String joincompany) {
		this.joincompany = joincompany;
	}
	String usernm; //사원이름
	String deptname; // 부서명
	String joincompany; // 입사일
	
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
	public String getPayDay() {
		return payDay;
	}
	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}
	@Override
	public String toString() {
		return "PaymentVo [payCode=" + payCode + ", userId=" + userId + ", totalWage=" + totalWage + ", totalSalary="
				+ totalSalary + ", relate=" + relate + ", payDay=" + payDay + ", positionname=" + positionname
				+ ", usernm=" + usernm + ", deptname=" + deptname + ", joincompany=" + joincompany + "]";
	}
	
	

}
