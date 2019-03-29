package kr.or.ddit.slip.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.slip.model.SlipVo;
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
	
	public int updateSlip(String arrIdx);
	
	public int updateSlip_paaprovuar(String status);

	/**
	* Method : insertSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipVo
	* @return
	* Method 설명 : 전표 추가 메서드
	*/
	public int insertSlip(SlipVo slipVo);
	
	
	
	/**
	* Method : currvalSeq
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 시퀀스 불러오기 - 현재값
	*/
	public String currvalSeq();
	
	
	/**
	* Method : deleteSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표 삭제
	*/
	public int deleteSlip(String slipNumber);
	
	
	/**
	* Method : getBetweenProd
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 날짜 검색
	*/
	public List<SlipVo> getBetweenSlip(String pre_date, String post_date);
	
}
