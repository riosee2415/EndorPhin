package kr.or.ddit.Attitude.service;

import java.util.List;

import kr.or.ddit.Attitude.model.AttitudeVo;

public interface IAttitudeService {
	
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 근태항목 전체 가져오기
	*/
	List<AttitudeVo> getAllAttitude();
	
	
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 근태항목 인서트
	*/
	int insertAttitude(AttitudeVo vo);
	
	
}