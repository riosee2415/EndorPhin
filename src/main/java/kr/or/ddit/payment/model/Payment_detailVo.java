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
	String deductPAy;
	String taxStatus;
	String bonusStatus;
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
	public String getDeductPAy() {
		return deductPAy;
	}
	public void setDeductPAy(String deductPAy) {
		this.deductPAy = deductPAy;
	}
	public String getTaxStatus() {
		return taxStatus;
	}
	public void setTaxStatus(String taxStatus) {
		this.taxStatus = taxStatus;
	}
	public String getBonusStatus() {
		return bonusStatus;
	}
	public void setBonusStatus(String bonusStatus) {
		this.bonusStatus = bonusStatus;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	
	

}
