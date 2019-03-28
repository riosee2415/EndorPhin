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

	
	

	/**
	* Method : selectSlipPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징처리를 위한 쿼리 실행
	*/
	@Override
	public Map<String, Object> selectSlipPagingList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("slipList", slipDao.selectSlipPagingList(pageVo));
		resultMap.put("slipCnt", slipDao.getSlipCount());
		
		return resultMap;
	}



	/**
	* Method : getSlipCnt
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 전표 수량 확인
	*/
	@Override
	public int getSlipCnt() {
		return slipDao.getSlipCount();
	}

	
	
	
	

}
