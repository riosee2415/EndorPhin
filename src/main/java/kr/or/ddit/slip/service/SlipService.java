package kr.or.ddit.slip.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.slip.dao.ISlipDao;
import kr.or.ddit.util.model.PageVo;

@Service("slipService")
public class SlipService implements ISlipService{
	
	@Resource(name="slipDao")
	private ISlipDao slipDao;

	
	
	
	@Override
	public Map<String, Object> selectSlipPagingList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("slipList", slipDao.selectSlipPagingList(pageVo));
		resultMap.put("slipCnt", slipDao.getSlipCount());
		
		return resultMap;
	}

	
	
	
	

}
