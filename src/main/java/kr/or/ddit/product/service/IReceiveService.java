package kr.or.ddit.product.service;

import java.util.List;

import kr.or.ddit.product.model.ReceiveVo;

public interface IReceiveService {
	int insertReceive(ReceiveVo receiveVo);
	List<ReceiveVo> getAllReceive();
	ReceiveVo selectReceive(String orderCode);
	int deleteReceive(String receiveCode);
	int updateReceive(ReceiveVo receiveVo);
}
