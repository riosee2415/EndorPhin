package kr.or.ddit.Attitude.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class Attitude_recordVo {
	
	String userId;
	Date startDay;
	Date endDay;
	String attitudeMemo;
	String status;
	String statusName;
	String attitudeCode;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public String getAttitudeMemo() {
		return attitudeMemo;
	}
	public void setAttitudeMemo(String attitudeMemo) {
		this.attitudeMemo = attitudeMemo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getAttitudeCode() {
		return attitudeCode;
	}
	public void setAttitudeCode(String attitudeCode) {
		this.attitudeCode = attitudeCode;
	}
	
	

}
