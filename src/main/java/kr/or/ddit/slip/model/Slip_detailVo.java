package kr.or.ddit.slip.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class Slip_detailVo {
	
	String slipDetailNo;
	String status;
	String price;
	String clientCard;
	String slipNumber;
	String establishCode;
	
	public String getSlipDetailNo() {
		return slipDetailNo;
	}
	public void setSlipDetailNo(String slipDetailNo) {
		this.slipDetailNo = slipDetailNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getClientCard() {
		return clientCard;
	}
	public void setClientCard(String clientCard) {
		this.clientCard = clientCard;
	}
	public String getSlipNumber() {
		return slipNumber;
	}
	public void setSlipNumber(String slipNumber) {
		this.slipNumber = slipNumber;
	}
	public String getEstablishCode() {
		return establishCode;
	}
	public void setEstablishCode(String establishCode) {
		this.establishCode = establishCode;
	}
	public Slip_detailVo() {
	}
	public Slip_detailVo(String slipDetailNo, String status, String price, String clientCard, String slipNumber,
			String establishCode) {
		this.slipDetailNo = slipDetailNo;
		this.status = status;
		this.price = price;
		this.clientCard = clientCard;
		this.slipNumber = slipNumber;
		this.establishCode = establishCode;
	}
	
}
