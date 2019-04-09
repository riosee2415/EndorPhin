package kr.or.ddit.tax_cal.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.ITax_calDao;
import kr.or.ddit.util.model.PageVo;

@Service("tax_calService")
public class Tax_calService implements ITax_calService{
	
	@Resource(name="tax_calDao")
	private ITax_calDao tax_calDao;

	@Override
	public Map<String, Object> selecTax_calPagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("tax_calList", tax_calDao.selecTax_calPagingList(pageVo));
		resultMap.put("tax_calCnt", tax_calDao.getTax_calCnt());
		
		return resultMap;
	}

}
