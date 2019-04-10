package kr.or.ddit.tax_cal.dao;

import kr.or.ddit.tax_cal.model.Sales_detailVo;

public interface ISales_detailDao {
	
	/**
	* Method : insertSales_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param sales_detailVo
	* @return
	* Method 설명 : 디테일 전표 삽입
	*/
	public int insertSales_detail(Sales_detailVo sales_detailVo);
		

}
