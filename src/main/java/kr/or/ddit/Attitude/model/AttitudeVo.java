package kr.or.ddit.Attitude.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class AttitudeVo {
	
	String attitudeCode;
	String attitudeName;
	String paidStatus;
	String relate;
	Date baseDays;
	
	
	public String getAttitudeCode() {
		return attitudeCode;
	}
	public void setAttitudeCode(String attitudeCode) {
		this.attitudeCode = attitudeCode;
	}
	public String getAttitudeName() {
		return attitudeName;
	}
	public void setAttitudeName(String attitudeName) {
		this.attitudeName = attitudeName;
	}
	public String getPaidStatus() {
		return paidStatus;
	}
	public void setPaidStatus(String paidStatus) {
		this.paidStatus = paidStatus;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public Date getBaseDays() {
		return baseDays;
	}
	public void setBaseDays(Date baseDays) {
		this.baseDays = baseDays;
	}
	
	
	
	
	

}
