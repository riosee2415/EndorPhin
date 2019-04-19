package kr.or.ddit.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IReceiveDao;
import kr.or.ddit.product.model.ReceiveVo;

@Service("receiveService")
public class ReceiveService implements IReceiveService{

	@Resource(name="receiveDao")
	IReceiveDao receiveDao;
	
	@Override
	public int insertReceive(ReceiveVo receiveVo) {
		return receiveDao.insertReceive(receiveVo);
	}

	@Override
	public List<ReceiveVo> getAllReceive() {
		return receiveDao.getAllReceive();
	}

	@Override
	public ReceiveVo selectReceive(String orderCode) {
		return receiveDao.selectReceive(orderCode);
	}

	@Override
	public int deleteReceive(String receiveCode) {
		return receiveDao.deleteReceive(receiveCode);
	}

	@Override
	public int updateReceive(ReceiveVo receiveVo) {
		return receiveDao.updateReceive(receiveVo);
	}

}
