package kr.or.ddit.annual.model;

/**
 * 
 * @author sanghoyun
 *
 */
public class AnnualVo {
	
	String userid;           //사원번호
	String annualdate;       //연차발생일자
	String annualstart;      //연차사용사용가능 시작일자
	String annualend;        //연차종료일자 
	String occurannual;      //발생연차수
	String userdate;         //사용일수
	
	
	
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAnnualdate() {
		return annualdate;
	}
	public void setAnnualdate(String annualdate) {
		this.annualdate = annualdate;
	}
	public String getAnnualstart() {
		return annualstart;
	}
	public void setAnnualstart(String annualstart) {
		this.annualstart = annualstart;
	}
	public String getAnnualend() {
		return annualend;
	}
	public void setAnnualend(String annualend) {
		this.annualend = annualend;
	}
	public String getOccurannual() {
		return occurannual;
	}
	public void setOccurannual(String occurannual) {
		this.occurannual = occurannual;
	}
	public String getUserdate() {
		return userdate;
	}
	public void setUserdate(String userdate) {
		this.userdate = userdate;
	}
	@Override
	public String toString() {
		return "AnnualVo [userid=" + userid + ", annualdate=" + annualdate + ", annualstart=" + annualstart
				+ ", annualend=" + annualend + ", occurannual=" + occurannual + ", userdate=" + userdate + "]";
	}
	

	
	
	
	
	
	
}
