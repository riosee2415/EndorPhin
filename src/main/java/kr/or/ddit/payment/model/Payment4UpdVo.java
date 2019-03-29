package kr.or.ddit.payment.model;

import java.util.List;

public class Payment4UpdVo {
	private String userid;
	private String payday;
	private List<String> decdMap;
	private List<String> decdPayList;
	
	public List<String> getDecdPayList() {
		return decdPayList;
	}
	public void setDecdPayList(List<String> decdPayList) {
		this.decdPayList = decdPayList;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPayday() {
		return payday;
	}
	public void setPayday(String payday) {
		this.payday = payday;
	}
	public List<String> getDecdMap() {
		return decdMap;
	}
	public void setDecdMap(List<String> decdMap) {
		this.decdMap = decdMap;
	}
	@Override
	public String toString() {
		return "TestVo [userid=" + userid + ", payday=" + payday + ", decdMap=" + decdMap + "]";
	}
	
}
