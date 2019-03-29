package kr.or.ddit.slip.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.Slip_detailVo;

@Repository("slip_detailDao")
public class Slip_detailDao implements ISlip_detailDao{
	
	
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	/**
	* Method : insertDetailSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param dVo
	* @return
	* Method 설명 : 전표상세 데이터 추가하기
	*/
	@Override
	public int insertDetailSlip(Slip_detailVo dVo) {
		
		return sqlSessionTemplate.insert("slipdetail.insertSlipdetail", dVo);
	}


	/**
	* Method : getSlip_detailBySlipNumber
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 조회
	*/
	@Override
	public List<Slip_detailVo> getSlip_detailBySlipNumber(String slipNumber) {
	
		return sqlSessionTemplate.selectList("slipdetail.getSlip_detailBySlipNumber",slipNumber);
	}


	/**
	* Method : deleteSlip_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 삭제
	*/
	@Override
	public int deleteSlip_detail(String slipNumber) {
		return sqlSessionTemplate.delete("slipdetail.deleteSlip_detail", slipNumber);
	}

}
