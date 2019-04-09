package kr.or.ddit.tax_cal.service;

import java.util.Map;

import kr.or.ddit.tax_cal.model.Tax_calVo;
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
	
	/**
	* Method : insertTax_cal
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param tax_calVo
	* @return
	* Method 설명 : 매입매출전표 데이터 추가
	*/
	public int insertTax_cal(Tax_calVo tax_calVo);
	
	/**
	* Method : getTax_seqNextval
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return  
	* Method 설명 : 시퀀스 값 가져오기
	*/
	public String getTax_seqNextval();
}
