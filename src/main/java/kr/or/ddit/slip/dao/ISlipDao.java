package kr.or.ddit.slip.dao;

import java.util.List;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.util.model.PageVo;

public interface ISlipDao {
	
	/**
	* Method : getSlipCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 전표 수량 확인
	*/
	public int getSlipCount();
	
	
	/**
	* Method : selectSlipPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징처리를 위한 쿼리 실행
	*/
	public List<SlipVo> selectSlipPagingList(PageVo pageVo);
	
	

}
