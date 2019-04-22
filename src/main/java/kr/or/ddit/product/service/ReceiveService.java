package kr.or.ddit.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IReceiveDao;
import kr.or.ddit.product.dao.IReceive_detailDao;
import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.product.model.Receive_detailVo;

@Service("receiveService")
public class ReceiveService implements IReceiveService{

	@Resource(name="receiveDao")
	IReceiveDao receiveDao;
	
	@Resource(name="receive_detailDao")
	IReceive_detailDao receive_detailDao;
	
	@Override
	public int insertReceive(ReceiveVo receiveVo) {
		return receiveDao.insertReceive(receiveVo);
	}

	@Override
	public int deleteReceive(String receiveCode) {
		return receiveDao.deleteReceive(receiveCode);
	}

	@Override
	public int updateReceive(ReceiveVo receiveVo) {
		return receiveDao.updateReceive(receiveVo);
	}


	@Override
	public List<ReceiveVo> getAllReceive(Map<String, Object> map) {
		return receiveDao.getAllReceive(map);
	}


	@Override
	public List<ReceiveVo> selectReceive(Map<String,Object> map) {
		return receiveDao.selectReceive(map);
	}

	@Override
	public Map<String, Object> selectReceiveNdetail(String orderCode) {
		Map<String,Object> map = new HashMap<>();
		map.put("orderCode",orderCode);
		List<ReceiveVo> allReceive = receiveDao.selectReceive(map);
		List<List<Receive_detailVo>> allList = new ArrayList<>();
		for (ReceiveVo receiveVo : allReceive) {
			if(receiveVo.getSortation().equals("0"))
				allList.add(receive_detailDao.getReceive_detail(receiveVo.getReceiveCode()));
		}
		map.put("allReceive", allReceive);
		map.put("allReceiveDetail", allList);
		return map;
	}



}
