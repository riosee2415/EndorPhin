package kr.or.ddit.slip.service;

import java.util.Map;

import kr.or.ddit.util.model.PageVo;

public interface ISlipService {
	

	/**
	* Method : selectSlipPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징처리를 위한 쿼리 실행
	*/
	public Map<String, Object> selectSlipPagingList(PageVo pageVo);

	
	/**
	* Method : getSlipCnt
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 전표 수량 확인
	*/
	public int getSlipCnt();
	
	
}
