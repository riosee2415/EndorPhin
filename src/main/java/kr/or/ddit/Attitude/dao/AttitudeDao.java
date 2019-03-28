package kr.or.ddit.Attitude.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.Attitude.model.AttitudeVo;

@Repository("attitudeDao")
public class AttitudeDao implements IAttitudeDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public List<AttitudeVo> getAllAttitude() {
				
				
		List<AttitudeVo> list = sqlSessionTemplate.selectList("attitude.getAllAttitude");
		
				return list;
				
	}
	
	@Override
	public int insertAttitude(AttitudeVo vo) {
		return sqlSessionTemplate.insert("attitude.insertAttitude",vo);
		
	}

}




























