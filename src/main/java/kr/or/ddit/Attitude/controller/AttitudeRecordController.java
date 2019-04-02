package kr.or.ddit.Attitude.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.Attitude.model.Attitude_recordVo;
import kr.or.ddit.Attitude.service.IAttitude_recordService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;

@RequestMapping("/attitudeRecord")
@Controller
public class AttitudeRecordController {
	private Logger logger = LoggerFactory.getLogger(AttitudeRecordController.class);
	
	
	@Resource(name = "attitude_recordService")
	private IAttitude_recordService attitude_recordService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	
	@RequestMapping(path = "/getAllattitudeRecord", method = RequestMethod.GET)
	public String getAllattitudeRecord(Model model) {
		
		
		List<Attitude_recordVo> allAttitude_record = attitude_recordService.getAllAttitude_record();
		
		
		model.addAttribute("allAttitude_record",allAttitude_record);
		
		return "Attitude_recordListTiles";
	}
	
	
	
	@RequestMapping(path = "/attitudeRecordInsert", method = RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> attitudeRecordInsert_GET(Model model, String[] userId) {
		
		
		
		List<String> check = new  ArrayList<String>();
		
		
		List<EmployeeVo> allAttitude_recordInsert = new  ArrayList<EmployeeVo>();
		
		
		for(String chk : userId){
			check.add(chk);
			EmployeeVo selectEmployee = employeeService.selectEmployee(chk);
			allAttitude_recordInsert.add(selectEmployee);
		}
		
		
			
		
		return allAttitude_recordInsert;
	
	
	}
	
	
	@RequestMapping(path = "/attitudeRecordInsert", method = RequestMethod.POST)
	public String attitudeRecordInsert_POST(Model model, Attitude_recordVo vo ,RedirectAttributes ra) {
		
		
		String[] tempUser =  vo.getUserid().split(",");
		String[] tempMemo =  vo.getAttitudememo().split(",");
		
		
		
		Attitude_recordVo userVo = new Attitude_recordVo();
		
		
		for (int i = 0; i < tempUser.length; i++) {
			userVo.setUserid(tempUser[i]);
			userVo.setStartday(vo.getStartday());
			userVo.setEndday(vo.getEndday());
			userVo.setStatus("승인");
			userVo.setAttitudememo(tempMemo[i]);
			userVo.setAttitudecode(vo.getAttitudecode());
			
			attitude_recordService.insertAttitude_record(userVo);
			
		}
			
			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
			return "redirect:/attitudeRecord/getAllattitudeRecord";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*@RequestMapping(path = "/insertAttitude", method = RequestMethod.GET)
	public String insertAttitude(Model model, AttitudeVo vo,RedirectAttributes ra) {
		
		
		int insertAttitude = attitudeService.insertAttitude(vo);
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/attitude/getAllAttitude";
	}
	
	
	
	
	
	
	
	@RequestMapping(path="/AttitudeIdAjax", method=RequestMethod.POST)
	@ResponseBody
	public String AttitudeIdAjax(@RequestParam(name="userId", defaultValue="WS")String userId) {
		
		
		List<AttitudeVo> allAttitude = attitudeService.getAllAttitude();
		String userIdCode = "1";
		
		
		for(int i = 0; i < allAttitude.size(); i++) {
			// Duplicate Code = 0
			if(userId.equals(allAttitude.get(i).getAttitudeCode())){
				userIdCode = "0";
				return userIdCode;
				
			// WhiteSpace Code = WS
			} else if(userId.equals("WS")) {
				userIdCode = "WS";
				return userIdCode;
			}
		}
		
		return userIdCode;
		
		
	}
	
	
	@RequestMapping(path = "/deleteAttitude", method = RequestMethod.GET)
	public String deleteAttitude(Model model, String delete_no,RedirectAttributes ra) {
		
		
		attitudeService.deleteAttitude(delete_no);
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		return "redirect:/attitude/getAllAttitude";
	}
	
	
	@RequestMapping(path = "/searchAttitude", method = RequestMethod.GET)
	public String searchAttitude(Model model, String search) {
		
		
		AttitudeVo vo = new AttitudeVo();
		
		vo.setAttitudeName(search);
		
		List<AttitudeVo> allAttitude = attitudeService.SearchAttitude(vo);
		
		
		model.addAttribute("allAttitude",allAttitude);
		
		return "AttitudeListTiles";
	}
	
	
	
	
	
	
	@RequestMapping(path = "/updateAttitude", method = RequestMethod.GET)
	@ResponseBody
	public AttitudeVo updateAttitude_GET(String userId,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		return  attitudeService.SelectAttitude(userId);
		
	}
	
	
	
	
	
	
	@RequestMapping(path = "/updateAttitude", method = RequestMethod.POST)
	public String updateAttitude_POST(AttitudeVo vo,RedirectAttributes ra){
		
		attitudeService.updateAttitude(vo);
		
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		return "redirect:/attitude/getAllAttitude";
		
	}
	*/
	


}
