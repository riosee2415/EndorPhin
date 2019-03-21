package kr.or.ddit.order.dao;

import java.util.List;

import kr.or.ddit.order.model.ClientVo;

public interface IClientDao {
	
	/**
	* Method : getAllClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 정보를 전부 조회한다.
	*/
	List<ClientVo> getAllClient();
}
