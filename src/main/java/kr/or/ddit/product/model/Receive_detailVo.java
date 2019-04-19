package kr.or.ddit.product.model;

public class Receive_detailVo {

	String receiveCode;
	String productCode;
	String quantity;
	public String getReceiveCode() {
		return receiveCode;
	}
	public void setReceiveCode(String receiveCode) {
		this.receiveCode = receiveCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Receive_detailVo [receiveCode=" + receiveCode + ", productCode=" + productCode + ", quantity="
				+ quantity + "]";
	}
	public Receive_detailVo(String receiveCode, String productCode, String quantity) {
		this.receiveCode = receiveCode;
		this.productCode = productCode;
		this.quantity = quantity;
	}
	public Receive_detailVo() {
	}
	
}
