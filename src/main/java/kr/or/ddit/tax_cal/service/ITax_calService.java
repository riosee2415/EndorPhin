package kr.or.ddit.tax_cal.service;

import java.util.Map;

import kr.or.ddit.util.model.PageVo;

public interface ITax_calService {

	
	/**
	* Method : selecTax_calPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이지 리스트 뷰
	*/
	public Map<String, Object> selecTax_calPagingList(PageVo pageVo);
}
