package kr.or.ddit.tax_cal.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class Tax_calVo {
	
	String salesCode;
	Date slipDate;
	String supplyValue;
	String salesStatus;
	String deptCode;
	String surtax;
	String orderCode;
	String clientCode;
	
	public String getSalesCode() {
		return salesCode;
	}
	public void setSalesCode(String salesCode) {
		this.salesCode = salesCode;
	}
	public Date getSlipDate() {
		return slipDate;
	}
	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}
	public String getSupplyValue() {
		return supplyValue;
	}
	public void setSupplyValue(String supplyValue) {
		this.supplyValue = supplyValue;
	}
	public String getSalesStatus() {
		return salesStatus;
	}
	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getSurtax() {
		return surtax;
	}
	public void setSurtax(String surtax) {
		this.surtax = surtax;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	
	

}
