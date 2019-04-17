package kr.or.ddit.schedule;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.set.LogicConfig;

public class ScheduleServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(ScheduleServiceTest.class);

	@Resource(name="scheduleService")
	IScheduleService scheduleService;
	
	@Test
	public void ScheduleInsertTest() {
		
		ScheduleVo vo = new ScheduleVo();
		
		vo.setSchedule_title("테스트트");
		vo.setSchedule_start("20101010");
		vo.setSchedule_end("20101011");
		
		scheduleService.insertSchedule(vo);
		
	}
	
	@Test
	public void getAllScheduleTest() {
		
		
		List<ScheduleVo> allSchedule = scheduleService.getAllSchedule();
		
		System.out.println("전체 :" + allSchedule);
		
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
}
