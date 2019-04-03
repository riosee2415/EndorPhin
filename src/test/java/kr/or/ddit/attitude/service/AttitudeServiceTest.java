package kr.or.ddit.attitude.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.Attitude.model.Attitude_recordVo;
import kr.or.ddit.Attitude.service.IAttitudeService;
import kr.or.ddit.Attitude.service.IAttitude_recordService;
import kr.or.ddit.set.LogicConfig;

public class AttitudeServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(AttitudeServiceTest.class);

	
	
	@Resource(name="attitudeService")
	private IAttitudeService attitudeService;
	
	@Resource(name = "attitude_recordService")
	private IAttitude_recordService attitude_recordService;
	
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
	
	
	@Test
	public void deleteAttitudeTest() {
		
		
		int deleteAttitude = attitudeService.deleteAttitude("7");
		
		
		
	}
	
	
	@Test
	public void updateAttitudeTest() {
		
	
	
		AttitudeVo vo = new AttitudeVo();
		vo.setAttitudeCode("6");
		vo.setAttitudeName("테스트5");
		vo.setPaidStatus("유급");
		vo.setBaseDays("2");
		vo.setRelate("");
	
	attitudeService.updateAttitude(vo);
	}
	
	
	@Test
	public void searchAttitudeTest() {
		
		
		AttitudeVo vo = new AttitudeVo();
		vo.setAttitudeName("세");
		List<AttitudeVo> searchAttitude = attitudeService.SearchAttitude(vo);
		
		for(AttitudeVo Attitude : searchAttitude){
			logger.debug("과자 : {}",Attitude);
			
		}
		
		
	}
	
	@Test
	public void selectAttitudeTest() {
		
		
		AttitudeVo selectAttitude = attitudeService.SelectAttitude("5");
		
			logger.debug("과자 : {}",selectAttitude);
			
		
	}
	
	@Test
	public void selectAttitude_recordTest() {
		
		
		List<Attitude_recordVo> allAttitude_records = attitude_recordService.getAllAttitude_record();
		
		for(Attitude_recordVo allAttitude_record : allAttitude_records){
			
			logger.debug("호랑이 : {}",allAttitude_record);
		}
		
		
	}
	
	
	@Test
	public void insertAttitude_recordTest() {
		
		Attitude_recordVo vo = new Attitude_recordVo();
		
		vo.setUserid("2");
		vo.setStartday("2018-01-01");
		vo.setEndday("2018-01-02");
		vo.setStatus("승인");
		vo.setAttitudememo("테스트");
		vo.setAttitudecode("1");
		
		
		attitude_recordService.insertAttitude_record(vo);
		
		
	}
	
	
	
	
	
	@Test
	public void test() {
		
		
		
		
		Attitude_recordVo vo = new Attitude_recordVo();
		
		vo.setUserid("2,65,3");
		vo.setStartday("2018-05-01");
		vo.setEndday("2018-05-02");
		vo.setStatus("승인");
		vo.setAttitudememo("11일휴가");
		vo.setAttitudecode("1");
		
			String[] temp =  vo.getUserid().split(",");
		
		Attitude_recordVo userVo = new Attitude_recordVo();
		
		
	/*	for (int i = 0; i < temp.length; i++) {
			userVo.setUserid(temp[i]);
			userVo.setStartday(vo.getStartday());
			userVo.setEndday(vo.getEndday());
			userVo.setStatus("승인");
			userVo.setAttitudememo(vo.getAttitudememo());
			userVo.setAttitudecode(vo.getAttitudecode());
			
			attitude_recordService.insertAttitude_record(userVo);
			
			
		}*/
		
	}
	
	
	
	
	
	@Test
	public void searchAttitude_recordTest() {
		
		Attitude_recordVo vo = new Attitude_recordVo();
		vo.setUsernm("임");
		vo.setStartday("2018-05-01");
		vo.setEndday("2018-05-04");
		
		List<Attitude_recordVo> searchAttitude_records = attitude_recordService.SearchAttitude_record(vo);
		
		
		for(Attitude_recordVo searchAttitude_record : searchAttitude_records){
			logger.debug("searchAttitude_record :{}",searchAttitude_record);
			
		}
		
	}
	
	@Test
	public void ArrayTest() {
		
		Attitude_recordVo vo = new Attitude_recordVo();
		String index = "";
		
		String[] temps = {"3,2019-03-28,65,2018-05-24"};
		
		
		for(String temp : temps){
			
			 index = temp;
		}
		
		
		
		String[] deleteArray = index.split(","); 	
		
		System.out.println("deleteArray" + deleteArray.length);
		
		
		
		for (int i = 0; i < deleteArray.length; i+=2) {
			vo.setUserid(deleteArray[i]);
			vo.setStartday(deleteArray[i +1]);
			
			logger.debug("하나 : {}",vo.getUserid());
			logger.debug("둘 : {}",vo.getStartday());
			
			
			
			
			//attitude_recordService.deleteAttitude_record(vo);
			
		}
		
		
	}
	
	@Test
	public void selectTest() {
		Attitude_recordVo vo = new Attitude_recordVo();
		vo.setUserid("3");
		vo.setStartday("2019-03-28");
		
		Attitude_recordVo selectAttitude_record = attitude_recordService.SelectAttitude_record(vo);
		
		
		logger.debug("하나 {}",selectAttitude_record);
	}
	
	
	@Test
	public void updateTest() {
		Attitude_recordVo vo = new Attitude_recordVo();
		vo.setUserid("3");
		vo.setStartday("2019-04-28");
		vo.setAfterStartday("2015-02-02");
		vo.setEndday("2015-06-06");
		vo.setStatus("승인");
		vo.setAttitudecode("2");
		
		
		int updateAttitude_record = attitude_recordService.updateAttitude_record(vo);
		
		
	}
	
	
	
	
	
}
