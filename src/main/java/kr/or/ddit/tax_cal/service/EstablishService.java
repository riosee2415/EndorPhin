package kr.or.ddit.tax_cal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.IEstablishDao;
import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.util.model.PageVo;

@Service("establishService")
public class EstablishService implements IEstablishService{
	
	@Resource(name="establishDao")
	private IEstablishDao establishDao;

	@Override
	public Map<String, Object> selectEstablishPagingList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("establishList", establishDao.selectEstablishPagingList(pageVo));
		resultMap.put("establishCnt", establishDao.getEstablishCount());
		
		return resultMap;
	}

	@Override
	public int getEstablishCount() {
		
		return establishDao.getEstablishCount();
	}

}
