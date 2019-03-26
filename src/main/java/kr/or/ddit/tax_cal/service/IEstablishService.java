package kr.or.ddit.tax_cal.service;

import java.util.Map;

import kr.or.ddit.util.model.PageVo;

public interface IEstablishService {
	
	/**
	* Method : selectEstablishPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이징 조회
	*/
	public Map<String, Object> selectEstablishPagingList(PageVo pageVo);
	
	
	/**
	* Method : getEstablishCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 수량 확인
	*/
	public int getEstablishCount();

}
