package kr.or.ddit.attitude.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.Attitude.service.IAttitudeService;
import kr.or.ddit.set.LogicConfig;

public class AttitudeServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(AttitudeServiceTest.class);

	
	
	@Resource(name="attitudeService")
	private IAttitudeService attitudeService;
	
	@Test
	public void allAttitudeTest() {
		
		List<AttitudeVo> allAttitude = attitudeService.getAllAttitude();
		
		for (AttitudeVo Attitude:allAttitude) {
			
			logger.debug("근태 {}",Attitude);
		}
		
	}
	
	
	
	@Test
	public void insertAttitudeTest() {
		
		AttitudeVo vo = new AttitudeVo();
		vo.setAttitudeCode("5");
		vo.setAttitudeName("테스트");
		vo.setPaidStatus("유급");
		vo.setRelate("테스트");
		vo.setBaseDays("1");
		
		attitudeService.insertAttitude(vo);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
