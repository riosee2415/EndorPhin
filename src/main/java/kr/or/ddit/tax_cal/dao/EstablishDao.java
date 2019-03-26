package kr.or.ddit.tax_cal.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.tax_cal.model.EstablishVo;

@Repository("establishDao")
public class EstablishDao implements IEstablishDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertEstablish(EstablishVo establishVo) {
		return sqlSessionTemplate.insert("establish.insertEstablish",establishVo);
	}

	@Override
	public int deleteEstablish(String establishcode) {
		return sqlSessionTemplate.delete("establish.deleteEstablish",establishcode);
	}

	@Override
	public List<EstablishVo> getAllEstablish() {
		return sqlSessionTemplate.selectList("establish.getAllEstablish");
	}

	@Override
	public EstablishVo selectEstablish(String establishcode) {
		return sqlSessionTemplate.selectOne("establish.selectEstablish",establishcode);
	}

	@Override
	public List<EstablishVo> selectEstablishByNm(String establishNameKor) {
		return sqlSessionTemplate.selectList("establish.selectEstablishByNm",establishNameKor);
	}

}
