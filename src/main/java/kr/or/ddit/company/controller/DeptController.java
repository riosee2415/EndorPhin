package kr.or.ddit.company.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.company.service.IDeptService;

//부서
@Controller
public class DeptController {
	
	private Logger logger = LoggerFactory.getLogger(DeptController.class);
	
	@Resource(name="deptService")
	private IDeptService deptService;
	
	@Resource(name="companyService")
	private ICompanyService companyService;
	
	
	@RequestMapping("/deptList")
	public String deptList(Model model){
		
		List<DeptVo> deptList = deptService.getAllDept();
		List<CompanyVo> companyList= companyService.getAllcompany();

		model.addAttribute("deptList", deptList);
		model.addAttribute("companyList", companyList);
		
		return "deptList";
	}
	
	//삭제 
	@RequestMapping(path="/deleteDept", method=RequestMethod.GET)
	public String deleteDept(Model model, @RequestParam("checkRow") String checkRow ){

		String[] arrIdx = checkRow.toString().split(",");
	
        for (int i=0; i<arrIdx.length; i++) {
		    int delCnt = deptService.deleteDept(arrIdx[i]);
		}
		
		return "redirect:/deptList";
	}
	
	//등록
	@RequestMapping(path="/insertDept", method=RequestMethod.GET)
	public String insertDept(DeptVo deptVo, Model model, @RequestParam("frmdeptCode") String deptCode 
														,@RequestParam("frmcompanyCode") String companyCode
														,@RequestParam("frmdeptName") String deptName){
													
		deptVo.setDeptCode(deptCode);
		deptVo.setCompanyCode(companyCode);
		deptVo.setDeptName(deptName);
		deptVo.setUseStatus("1");
		
		int insertCnt = deptService.insertDept(deptVo);
		
		if(insertCnt > 0){
			return "redirect:/deptList";
		}else{
			return "redirect:/deptList";
		}
	}
	
	@RequestMapping("/searchCompanyAjax")
	public String searchCompany(@RequestParam("companyName")String companyName, Model model) {
		
		List<CompanyVo> companyList = companyService.serachCompany(companyName);
		model.addAttribute("companyList", companyList);
		
		return "dept/companySearchAjax";
	}
	
	
	//중복체크 
	@RequestMapping(path="/DupleDept", method=RequestMethod.POST)
	@ResponseBody
	public String DuplCards(@RequestParam(name="deptCode", defaultValue="empty") String deptCode){
		List<DeptVo> deptList = deptService.getAllDept();
		
		// |"0":중복 x |"1" : 중복  | "2": 중복체크 클릭 x|
		String dupleCode = "0"; // 중복안될 때  
		
		for(int i = 0; i < deptList.size(); i++){
			
			if(deptCode.equals(deptList.get(i).getDeptCode())){
				dupleCode = "1";
				return dupleCode;
			}else if(deptCode.equals("empty")){
				dupleCode = "empty";
				return dupleCode;
			}
		}
		
		return dupleCode;
	}
	//수정하기 
	@RequestMapping(path="/updDept", method=RequestMethod.GET)
	public String updDept(DeptVo dept, Model model, @RequestParam("frmdeptCode1") String frmdeptCode1,
													  @RequestParam("frmdeptName1") String frmdeptName1,
													  @RequestParam("frmcompanyCode1") String frmcompanyCode1 ){
		
		dept.setDeptCode(frmdeptCode1);
		dept.setDeptName(frmdeptName1);
		dept.setCompanyCode(frmcompanyCode1);
		
		int updCnt = deptService.updateDept(dept);
		
		if(updCnt > 0){
			return "redirect:/deptList";
		}
		else{
			return "redirect:/deptList";
		}
	}
	
}
