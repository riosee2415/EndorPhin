package kr.or.ddit.annual.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.annual.service.IAnnualService;

@RequestMapping("/annual")
@Controller
public class AnnualController {
	private Logger logger = LoggerFactory.getLogger(AnnualController.class);
	
	
	@Resource(name = "annualService")
	private IAnnualService annualService;
	
	
	
	@RequestMapping(path = "/getAllattitudeRecord", method = RequestMethod.GET)
	public String getAllattitudeRecord(Model model) {
		
		
		
		return "Attitude_recordListTiles";
	}
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*@RequestMapping(path = "/attitudeRecordInsert", method = RequestMethod.GET)
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
	*/
	
	
	


}
