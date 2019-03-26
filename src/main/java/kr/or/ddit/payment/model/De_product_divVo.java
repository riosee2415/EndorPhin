package kr.or.ddit.payment.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class De_product_divVo {
	
	String deductCode;
	String deductName;
	String useStatus;
	String relate;
	String taxStatus;
	String bonusStatus;
	String establishcode; // 공제 항목에서의 계정과목
	String deprostatus; // 공제 항목과 급여 항목 구분 
	
	public String getEstablishcode() {
		return establishcode;
	}
	public void setEstablishcode(String establishcode) {
		this.establishcode = establishcode;
	}
	public String getDeprostatus() {
		return deprostatus;
	}
	public void setDeprostatus(String deprostatus) {
		this.deprostatus = deprostatus;
	}
	@Override
	public String toString() {
		return "De_product_divVo [deductCode=" + deductCode + ", deductName=" + deductName + ", useStatus=" + useStatus
				+ ", relate=" + relate + ", taxStatus=" + taxStatus + ", bonusStatus=" + bonusStatus + "]";
	}
	public String getDeductCode() {
		return deductCode;
	}
	public void setDeductCode(String deductCode) {
		this.deductCode = deductCode;
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
	public String getDeductName() {
		return deductName;
	}
	public void setDeductName(String deductName) {
		this.deductName = deductName;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	
	

}
