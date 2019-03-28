package kr.or.ddit.Attitude.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.Attitude.dao.IAttitudeDao;
import kr.or.ddit.Attitude.model.AttitudeVo;


@Service("attitudeService")
public class AttitudeService implements IAttitudeService{
	
	
	
	@Resource(name="attitudeDao")
	private IAttitudeDao attitudeDao;

	@Override
	public List<AttitudeVo> getAllAttitude() {
		return attitudeDao.getAllAttitude();
	}

	
	
	@Override
	public int insertAttitude(AttitudeVo vo) {
		return attitudeDao.insertAttitude(vo);
	}

	
	
	
	
	
}
