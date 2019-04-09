package kr.or.ddit.tax_cal.dao;

import java.util.List;

import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.util.model.PageVo;

public interface ITax_calDao {
	
	/**
	* Method : selecTax_calPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이지 리스트 뷰
	*/
	public List<Tax_calVo> selecTax_calPagingList(PageVo pageVo);
	
	
	/**
	* Method : getTax_calCnt
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 매입매출전표 수량 확인
	*/
	public int getTax_calCnt();

	
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
