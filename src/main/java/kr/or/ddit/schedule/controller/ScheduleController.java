package kr.or.ddit.schedule.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.controller.EmployeeController;
import kr.or.ddit.employee.model.EmployeeVo;
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
	public List<ScheduleVo> scheduleInsertAjax(String title,String userid,  String start,String end,String allDay,HttpServletRequest request) {
		
		//EmployeeVo attribute = (EmployeeVo) request.getSession().getAttribute("employeeVo");
		
		if(title != null && start != null && end != null){
		ScheduleVo vo = new ScheduleVo();
		vo.setSchedule_title(title);
		vo.setSchedule_start(start);
		vo.setSchedule_end(end);
		vo.setUserid(userid);
		scheduleService.insertSchedule(vo);
		}
		
		return getAllSchedule();
	}
	
	
	@RequestMapping(path="/scheduleDeleteAjax", method=RequestMethod.GET)
	@ResponseBody
	public List<ScheduleVo> scheduleDeleteAjax(String scNo) {
		
		scheduleService.deleteSchedule(scNo);
		
		return getAllSchedule();
	}
	
	
	@RequestMapping(path="/scheduleUpdateAjax", method=RequestMethod.GET)
	@ResponseBody
	public List<ScheduleVo> scheduleUpdateAjax(ScheduleVo vo) {
		
		System.out.println(vo.getSchedule_no());
		System.out.println(vo.getSchedule_title());
		System.out.println(vo.getSchedule_start());
		System.out.println(vo.getSchedule_end());
		
		scheduleService.modifySchedule(vo);
		
		return getAllSchedule();
	}
	
	
}
