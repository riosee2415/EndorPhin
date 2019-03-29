package kr.or.ddit.slip.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.util.model.PageVo;

@Repository("slipDao")
public class SlipDao implements ISlipDao{

	

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	/**
	* Method : getSlipCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 전표 수량 확인
	*/
	@Override
	public int getSlipCount() {
		return sqlSessionTemplate.selectOne("slip.getSlipCnt");
	}



	/**
	* Method : selectSlipPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징처리를 위한 쿼리 실행
	*/
	@Override
	public List<SlipVo> selectSlipPagingList(PageVo pageVo) {
		return sqlSessionTemplate.selectList("slip.selectSlipPagingList", pageVo);
	}



	/**
	* Method : insertSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipVo
	* @return
	* Method 설명 : 전표 추가 메서드
	*/
	@Override
	public int insertSlip(SlipVo slipVo) {
		return sqlSessionTemplate.insert("slip.insertSlip",slipVo);
	}



	@Override
	public String currvalSeq() {
		return sqlSessionTemplate.selectOne("slip.currvalSeq");
	}


	/**
	* Method : deleteSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표 삭제
	*/
	@Override
	public int deleteSlip(String slipNumber) {
		return sqlSessionTemplate.delete("slip.deleteSlip", slipNumber);
	}
	
	

}
