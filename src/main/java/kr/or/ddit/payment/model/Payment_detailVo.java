package kr.or.ddit.payment.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Payment_detailVo {
	
	String deductCode;
	String payCode;
	String deductPay;
	String deprostatus;
	
	public String getDeprostatus() {
		return deprostatus;
	}
	public void setDeprostatus(String deprostatus) {
		this.deprostatus = deprostatus;
	}
	public Payment_detailVo() {
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
	public Payment_detailVo(String deductCode, String payCode, String deductPay) {
		this.deductCode = deductCode;
		this.payCode = payCode;
		this.deductPay = deductPay;
	}
	public Payment_detailVo(String deductCode, String payCode) {
		this.deductCode = deductCode;
		this.payCode = payCode;
	}
	public Payment_detailVo(String deductCode, String payCode, String deductPay, String deprostatus) {
		this.deductCode = deductCode;
		this.payCode = payCode;
		this.deductPay = deductPay;
		this.deprostatus = deprostatus;
	}
	
	

}
