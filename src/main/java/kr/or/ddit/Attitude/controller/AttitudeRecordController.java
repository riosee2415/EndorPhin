package kr.or.ddit.Attitude.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	@RequestMapping(path = "/SearchattitudeRecord", method = RequestMethod.GET)
	public String SearchattitudeRecord(Model model, String search
			, String startDate, String endDate) {
		
		
		Attitude_recordVo Vo = new Attitude_recordVo();
		Vo.setUsernm(search);
		Vo.setStartday(startDate);
		Vo.setEndday(endDate);
		
		
		List<Attitude_recordVo> allAttitude_record = attitude_recordService.SearchAttitude_record(Vo);
		
		
		model.addAttribute("allAttitude_record",allAttitude_record);
		
		return "Attitude_recordListTiles";
	}
	
	
	@RequestMapping(path = "/deleteAttitudeRecord", method = RequestMethod.GET)
	public String deleteAttitudeRecord(Model model,RedirectAttributes ra, HttpServletRequest req) {
		Attitude_recordVo vo = new Attitude_recordVo();
		String index = "";
		
		String[] temps = req.getParameterValues("delete_no");
		
		           
		
		for(String temp : temps){
			
			 index = temp;
		}
		
		String[] deleteArray = index.split(","); 	
		
		
		for (int i = 0; i < deleteArray.length; i+=2) {
			vo.setUserid(deleteArray[i]);
			vo.setStartday(deleteArray[i +1]);
			
			
			attitude_recordService.deleteAttitude_record(vo);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		return "redirect:/attitudeRecord/getAllattitudeRecord";
	}
	
	
	
	
	
	
	@RequestMapping(path = "/attitudeRecordUpdate", method = RequestMethod.GET)
	@ResponseBody
	public Attitude_recordVo attitudeRecordUpdate_GET(Model model,String userid, String startday) {
		
		Attitude_recordVo vo = new Attitude_recordVo();
		vo.setUserid(userid);
		vo.setStartday(startday);
		
		Attitude_recordVo selectAttitude_record = attitude_recordService.SelectAttitude_record(vo);
		
		
		return selectAttitude_record;
	
	}
	
	
	
	
	
	@RequestMapping(path = "/attitudeRecordUpdate", method = RequestMethod.POST)
	public String attitudeRecordUpdate_POST(Model model,Attitude_recordVo vo,RedirectAttributes ra) {
		
		vo.setStatus("승인");
		
		System.out.println("기존 날짜 :" + vo.getStartday());
		System.out.println("변경 날짜 :" +vo.getAfterStartday());
		
		attitude_recordService.updateAttitude_record(vo);
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
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
