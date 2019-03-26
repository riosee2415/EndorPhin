package kr.or.ddit.tax_cal.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.util.model.PageVo;

@Repository("establishDao")
public class EstablishDao implements IEstablishDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	
	
	/**
	* Method : selectEstablishPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이징 조회
	*/
	@Override
	public List<EstablishVo> selectEstablishPagingList(PageVo pageVo) {
		return sqlSessionTemplate.selectList("establish.selectEstablishPagingList", pageVo);
	}


	/**
	* Method : getEstablishCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 수량 확인
	*/
	@Override
	public int getEstablishCount() {
		return sqlSessionTemplate.selectOne("establish.getEstablishCnt");
	}

}
