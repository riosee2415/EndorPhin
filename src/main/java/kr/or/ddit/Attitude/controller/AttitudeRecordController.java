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

import kr.or.ddit.Attitude.model.Attitude_recordVo;
import kr.or.ddit.Attitude.service.IAttitude_recordService;

@RequestMapping("/attitudeRecord")
@Controller
public class AttitudeRecordController {
	private Logger logger = LoggerFactory.getLogger(AttitudeRecordController.class);
	
	
	@Resource(name = "attitude_recordService")
	private IAttitude_recordService attitude_recordService;
	
	
	
	
	@RequestMapping(path = "/getAllattitudeRecord", method = RequestMethod.GET)
	public String getAllattitudeRecord(Model model) {
		
		
		List<Attitude_recordVo> allAttitude_record = attitude_recordService.getAllAttitude_record();
		
		model.addAttribute("allAttitude_record",allAttitude_record);
		
		return "Attitude_recordListTiles";
	}
	
	
	
	@RequestMapping(path = "/attitudeRecordInsert", method = RequestMethod.GET)
	public String attitudeRecordInsert(Model model, String[] check_no) {
		
		
		List<String> check = new  ArrayList<String>();
		
		
		
		List<Attitude_recordVo> allAttitude_recordInsert = new  ArrayList<Attitude_recordVo>();
		
		
		
		for(String chk : check_no){
			check.add(chk);
		}
		
		List<Attitude_recordVo> allAttitude_record = attitude_recordService.getAllAttitude_record();
		
		for (int i = 0; i < allAttitude_record.size(); i++) {
			if(allAttitude_record.get(i).getUserid().equals(check.get(i))){
				
				allAttitude_recordInsert.add(allAttitude_record.get(i));
				
				
			}
			
		}
		
		model.addAttribute("allAttitude_recordInsert",allAttitude_recordInsert);
		
		return "Attitude_recordListTiles";
	
	
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
