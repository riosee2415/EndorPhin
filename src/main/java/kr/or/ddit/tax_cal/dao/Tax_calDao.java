package kr.or.ddit.tax_cal.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.util.model.PageVo;


@Repository("tax_calDao")
public class Tax_calDao implements ITax_calDao{
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	* Method : selecTax_calPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 paging
	*/
	@Override
	public List<Tax_calVo> selecTax_calPagingList(PageVo pageVo) {
		return sqlSessionTemplate.selectList("tax_cal.selecTax_calPagingList",pageVo);
	}

	/**
	* Method : getTax_calCnt
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 매입매출 전표 수량 확인
	*/
	@Override
	public int getTax_calCnt() {
		return sqlSessionTemplate.selectOne("tax_cal.getTax_calCnt");
	}

	@Override
	public int insertTax_cal(Tax_calVo tax_calVo) {
		return sqlSessionTemplate.insert("tax_cal.insertTax_cal", tax_calVo);
	}

	@Override
	public String getTax_seqNextval() {
		return sqlSessionTemplate.selectOne("tax_cal.getTax_seqNextval");
	}

	@Override
	public int updateTax_cal(Tax_calVo tax_calVo) {
		return sqlSessionTemplate.update("tax_cal.updateTaX_cal", tax_calVo);
	}

}
