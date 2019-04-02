package kr.or.ddit.slip.model;

import java.util.Date;

/**
 * 
 * @author sanghoyun
 *
 */
public class AssetVo {
   String assetCode; //자산코드  =
   String assetName; //자산명  =
   Date   acquisitionDate; //취득일  =
   String accountName; //계정명  =
   String clientName; //거래처명  =
   String sanggakWay; //상각방법  =
   String acquisitionPrice; //취득금액  =
   String slipNumber; //전표번호
   String residualvalue; //잔존가치  =
   String unit; //단위 =
   String jukyo; //적요 =
   String unitPrice; //단가  =
   String quantity; // 수량   =
   String companyCode;//회사코드
   String sanggakCode; //감가상각계정코드  =
public String getAssetCode() {
	return assetCode;
}
public void setAssetCode(String assetCode) {
	this.assetCode = assetCode;
}
public String getAssetName() {
	return assetName;
}
public void setAssetName(String assetName) {
	this.assetName = assetName;
}
public Date getAcquisitionDate() {
	return acquisitionDate;
}
public void setAcquisitionDate(Date acquisitionDate) {
	this.acquisitionDate = acquisitionDate;
}
public String getAccountName() {
	return accountName;
}
public void setAccountName(String accountName) {
	this.accountName = accountName;
}
public String getClientName() {
	return clientName;
}
public void setClientName(String clientName) {
	this.clientName = clientName;
}
public String getSanggakWay() {
	return sanggakWay;
}
public void setSanggakWay(String sanggakWay) {
	this.sanggakWay = sanggakWay;
}
public String getAcquisitionPrice() {
	return acquisitionPrice;
}
public void setAcquisitionPrice(String acquisitionPrice) {
	this.acquisitionPrice = acquisitionPrice;
}
public String getSlipNumber() {
	return slipNumber;
}
public void setSlipNumber(String slipNumber) {
	this.slipNumber = slipNumber;
}
public String getResidualvalue() {
	return residualvalue;
}
public void setResidualvalue(String residualvalue) {
	this.residualvalue = residualvalue;
}
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	this.unit = unit;
}
public String getJukyo() {
	return jukyo;
}
public void setJukyo(String jukyo) {
	this.jukyo = jukyo;
}
public String getUnitPrice() {
	return unitPrice;
}
public void setUnitPrice(String unitPrice) {
	this.unitPrice = unitPrice;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public String getCompanyCode() {
	return companyCode;
}
public void setCompanyCode(String companyCode) {
	this.companyCode = companyCode;
}
public String getSanggakCode() {
	return sanggakCode;
}
public void setSanggakCode(String sanggakCode) {
	this.sanggakCode = sanggakCode;
}
   

	    
  
}
