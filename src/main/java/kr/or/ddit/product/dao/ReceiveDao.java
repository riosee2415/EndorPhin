package kr.or.ddit.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.product.model.ReceiveVo;

@Repository("receiveDao")
public class ReceiveDao implements IReceiveDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertReceive(ReceiveVo receiveVo) {
		return sqlSessionTemplate.insert("receive.insertReceive",receiveVo);
	}

	@Override
	public List<ReceiveVo> getAllReceive() {
		return sqlSessionTemplate.selectList("receive.getAllReceive");
	}

	@Override
	public ReceiveVo selectReceive(String orderCode) {
		return sqlSessionTemplate.selectOne("receive.selectReceive",orderCode);
	}

	@Override
	public int deleteReceive(String receiveCode) {
		return sqlSessionTemplate.delete("receive.deleteReceive",receiveCode);
	}

	@Override
	public int updateReceive(ReceiveVo receiveVo) {
		return sqlSessionTemplate.update("receive.updateReceive",receiveVo);
	}

}
