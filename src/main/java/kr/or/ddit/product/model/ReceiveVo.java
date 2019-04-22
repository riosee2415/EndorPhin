package kr.or.ddit.product.model;

/**
 * 
 * @author sanghoyun
 *
 */
public class ReceiveVo {
	
	String receiveCode;
	String receiveDate;
	String sortation;
	String material;
	String warehouseCode;
	String orderCode;
	
	String baseprice; // 금액
	String warehousename; // 창고명
	
	public String getWarehousename() {
		return warehousename;
	}
	public void setWarehousename(String warehousename) {
		this.warehousename = warehousename;
	}
	public String getBaseprice() {
		return baseprice;
	}
	public void setBaseprice(String baseprice) {
		this.baseprice = baseprice;
	}
	public String getReceiveCode() {
		return receiveCode;
	}
	public void setReceiveCode(String receiveCode) {
		this.receiveCode = receiveCode;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getWarehouseCode() {
		return warehouseCode;
	}
	public void setWarehouseCode(String warehouseCode) {
		this.warehouseCode = warehouseCode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	@Override
	public String toString() {
		return "ReceiveVo [receiveCode=" + receiveCode + ", receiveDate=" + receiveDate + ", sortation=" + sortation
				+ ", material=" + material + ", warehouseCode=" + warehouseCode + ", orderCode=" + orderCode
				+ ", baseprice=" + baseprice + ", warehousename=" + warehousename + "]";
	}
	public ReceiveVo() {
	}
	public ReceiveVo(String receiveDate, String sortation, String warehouseCode) {
		this.receiveDate = receiveDate;
		this.sortation = sortation;
		this.warehouseCode = warehouseCode;
	}
	
	
	

}
