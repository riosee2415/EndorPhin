package kr.or.ddit.employee.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class EmployeeVo {
	
	String userId;
	String userNm;
	String deptCode;
	String positionCode;
	String rankCode;
	String continuousYear;
	String relate;
	Date joinCompany;
	String BirthDate;
	String password;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getRankCode() {
		return rankCode;
	}
	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}
	public String getContinuousYear() {
		return continuousYear;
	}
	public void setContinuousYear(String continuousYear) {
		this.continuousYear = continuousYear;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public Date getJoinCompany() {
		return joinCompany;
	}
	public void setJoinCompany(Date joinCompany) {
		this.joinCompany = joinCompany;
	}
	
	
	public String getBirthDate() {
		return BirthDate;
	}
	public void setBirthDate(String birthDate) {
		BirthDate = birthDate;
	}
	@Override
	public String toString() {
		return "EmployeeVo [userId=" + userId + ", userNm=" + userNm + ", deptCode=" + deptCode + ", positionCode="
				+ positionCode + ", rankCode=" + rankCode + ", continuousYear=" + continuousYear + ", relate=" + relate
				+ ", joinCompany=" + joinCompany + ", BirthDate=" + BirthDate + ", password=" + password + "]";
	}
	
	
	
	

}
