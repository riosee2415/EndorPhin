package kr.or.ddit.product.dao;

import java.util.List;

import kr.or.ddit.product.model.ReceiveVo;

public interface IReceiveDao {
	int insertReceive(ReceiveVo receiveVo);
	List<ReceiveVo> getAllReceive();
	ReceiveVo selectReceive(String orderCode);
	int deleteReceive(String receiveCode);
	int updateReceive(ReceiveVo receiveVo);
	
}
