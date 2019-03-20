package kr.or.ddit.slip.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class SlipVo {
	
	String slipNumber;
	String total;
	Date slipDate;
	String departmentName;
	String jukyo;
	String status;
	
	public String getSlipNumber() {
		return slipNumber;
	}
	public void setSlipNumber(String slipNumber) {
		this.slipNumber = slipNumber;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public Date getSlipDate() {
		return slipDate;
	}
	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getJukyo() {
		return jukyo;
	}
	public void setJukyo(String jukyo) {
		this.jukyo = jukyo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
