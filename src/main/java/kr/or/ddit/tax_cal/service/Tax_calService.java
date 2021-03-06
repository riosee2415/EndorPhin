package kr.or.ddit.tax_cal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.ITax_calDao;
import kr.or.ddit.tax_cal.model.Tax_calVo;
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

	@Override
	public int insertTax_cal(Tax_calVo tax_calVo) {
		return tax_calDao.insertTax_cal(tax_calVo);
	}

	@Override
	public String getTax_seqNextval() {
		return tax_calDao.getTax_seqNextval();
	}

	@Override
	public int updateTax_cal(Tax_calVo tax_calVo) {
		return tax_calDao.updateTax_cal(tax_calVo);
	}

	@Override
	public Map<String, Object> selecTax_calPagingList_search(PageVo pageVo) {
		

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("tax_calList", tax_calDao.selecTax_calPagingList(pageVo));
		resultMap.put("tax_calCnt", tax_calDao.getTax_calCnt());
		
		return resultMap;
	}

	@Override
	public int deleteTax_cal(String salesCode) {
		return tax_calDao.deleteTax_cal(salesCode);
	}

	@Override
	public List<Tax_calVo> searchAllByType() {
		return tax_calDao.searchAllByType();
	}

	@Override
	public List<Tax_calVo> searchAllByType2() {
		return tax_calDao.searchAllByType2();
	}

	@Override
	public List<Tax_calVo> searchAllByType51(String searchData2) {
		return tax_calDao.searchAllByType51(searchData2);
	}

	@Override
	public List<Map<String, String>> selectBy51(String startDate, String endDate) {
		return tax_calDao.selectBy51(startDate, endDate);
	}

}
