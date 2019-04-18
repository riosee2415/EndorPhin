package kr.or.ddit.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.controller.EmployeeController;
import kr.or.ddit.schedule.model.ScheduleVo;
import kr.or.ddit.schedule.service.IScheduleService;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Resource(name="scheduleService")
	IScheduleService scheduleService;
	
	
	
	
	@RequestMapping(path = "/view", method = RequestMethod.GET)
	public String getAllEmployee() {
		
		
		return "scheduleTiles";
	}
	
	
	@RequestMapping(path = "/getAllSchedule", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleVo> getAllSchedule() {
		
		
		List<ScheduleVo> allSchedule = scheduleService.getAllSchedule();
		
		
		return allSchedule;
	}
	
	
	
	

	
	@RequestMapping(path="/scheduleInsertAjax", method=RequestMethod.GET)
	@ResponseBody
	public String scheduleInsertAjax(String title, String start,String end,String allDay) {
		
		
		if(title != null && start != null && end != null){
		ScheduleVo vo = new ScheduleVo();
		vo.setSchedule_title(title);
		vo.setSchedule_start(start);
		vo.setSchedule_end(end);
		scheduleService.insertSchedule(vo);
		}
		
		
		return "redirect:/view/getAllSchedule";
	}
	
	
	
	@RequestMapping(path="/scheduleDeleteAjax", method=RequestMethod.GET)
	@ResponseBody
	public String scheduleDeleteAjax(String scNo) {
		
		scheduleService.deleteSchedule(scNo);
		
		return "redirect:/view/getAllSchedule";
	}
	
	
	
	
	
	
	
	
	
}
