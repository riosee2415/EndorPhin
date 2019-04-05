package kr.or.ddit.annual.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.Attitude.model.Attitude_recordVo;
import kr.or.ddit.annual.model.AnnualVo;
import kr.or.ddit.annual.service.IAnnualService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;

@RequestMapping("/annual")
@Controller
public class AnnualController {
	private Logger logger = LoggerFactory.getLogger(AnnualController.class);
	
	
	@Resource(name = "annualService")
	private IAnnualService annualService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	
	@RequestMapping(path = "/getAllannual", method = RequestMethod.GET)
	public String getAllannual(Model model) {
		
		List<AnnualVo> allAnnual = annualService.getAllAnnual();
		
		model.addAttribute("allAnnual",allAnnual);
		
		return "AnnualListTiles";
	}
	
	
	
	
	@RequestMapping(path = "/annualInsert", method = RequestMethod.POST)
	public String annualInsert_POST(Model model, AnnualVo vo ,RedirectAttributes ra) {
		
		
		
		
		String[] tempUser =  vo.getUserid().split(",");
		String[] tempAnnualdate =  vo.getAnnualdate().split(",");
		String[] tempUserdate =  vo.getUserdate().split(",");
		
		
		
		AnnualVo annualvo = new AnnualVo();
		
		
		for (int i = 0; i < tempUser.length; i++) {

			annualvo.setUserid(tempUser[i]);
			annualvo.setAnnualdate(tempAnnualdate[i]);
			
			
			EmployeeVo selectEmployee = employeeService.selectEmployee(tempUser[i]);
			String tempYear = selectEmployee.getContinuousYear();
			switch (tempYear) {
			case "1":
			case "2":
				annualvo.setOccurannual("15");
				break;
			case "3":
			case "4":
				annualvo.setOccurannual("16");
				break;
			case "5":
			case "6":
				annualvo.setOccurannual("17");
				break;
			case "7":
			case "8":
				annualvo.setOccurannual("18");
				break;
			case "9":
			case "10":
				annualvo.setOccurannual("19");
				break;
			default:
				break;
			}
			annualvo.setUserdate(tempUserdate[i]);
			
			annualService.insertAnnual(annualvo);
		}
			
			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
			return "redirect:/annual/getAllannual";
		
	}
	
	
	
	
	@RequestMapping(path = "/deleteAnnual", method = RequestMethod.GET)
	public String deleteAnnual(Model model,RedirectAttributes ra, HttpServletRequest req) {
		AnnualVo vo = new AnnualVo();
		
		String index = "";
		
		String[] temps = req.getParameterValues("delete_no");
		
		
		for(String temp : temps){
			
			 index = temp;
		}
		
		String[] deleteArray = index.split(","); 	
		
		
		for (int i = 0; i < deleteArray.length; i+=2) {
			vo.setUserid(deleteArray[i]);
			vo.setAnnualdate(deleteArray[i +1]);
			annualService.deleteAnnual(vo);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		return "redirect:/annual/getAllannual";
	}
	
	
	
	@RequestMapping(path = "/annualSearch", method = RequestMethod.GET)
	public String annualSearch(Model model,RedirectAttributes ra,HttpServletRequest req) {
		
		AnnualVo vo = new AnnualVo();
		
		String index = "";
		
		String[] temps = req.getParameterValues("annualSearch");
		
		
			for(String temp : temps){
			 index = temp;
		    }
		
			String[] deleteArray = index.split(","); 	
			
			try {
				
				if(deleteArray[0] !=null){
					vo.setAnnualdate(deleteArray[0]);
					}
					
					if(deleteArray[1] !=null){
					vo.setUsernm(deleteArray[1]);
					}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			List<AnnualVo> allAnnual = annualService.SearchAnnual(vo);
			
			model.addAttribute("allAnnual",allAnnual);
		
			return "AnnualListTiles";
	
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
