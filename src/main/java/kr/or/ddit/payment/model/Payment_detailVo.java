package kr.or.ddit.payment.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Payment_detailVo {
	
	String payDetailCode;
	String deductCode;
	String payCode;
	String deductPay;
	String useStatus;
	
	public String getPayDetailCode() {
		return payDetailCode;
	}
	public void setPayDetailCode(String payDetailCode) {
		this.payDetailCode = payDetailCode;
	}
	public String getDeductCode() {
		return deductCode;
	}
	public void setDeductCode(String deductCode) {
		this.deductCode = deductCode;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public String getDeductPay() {
		return deductPay;
	}
	public void setDeductPay(String deductPay) {
		this.deductPay = deductPay;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	
	

}
