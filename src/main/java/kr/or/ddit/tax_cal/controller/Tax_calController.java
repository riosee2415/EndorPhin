package kr.or.ddit.tax_cal.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.constant.SalesCodeConstant;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ICilentService;

@Controller
public class Tax_calController {
	
	private Logger logger = LoggerFactory.getLogger(Tax_calController.class);
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	@Resource(name="deptService")
	private IDeptService deptService;
	
	@RequestMapping(path="taxcallview", method=RequestMethod.GET)
	public String taxcallview(Model model) {
		
		model.addAttribute("scCode", SalesCodeConstant.salesCode);
		model.addAttribute("phCode", SalesCodeConstant.purchaseCode);
		
		return "taxcallview";
	}

	
	
	
	// Ajax를 통해 거래처 데이터 가져오기
	@RequestMapping("/findClient")
	public String findClient(Model model) {
		List<ClientVo> clientList = clientService.getAllClient(); 
		model.addAttribute("clientList", clientList);
			
		return "taxcal/findClient";
	}
	
	
	
	
	@RequestMapping("/findDept")
	public String findDept(Model model) {
		List<DeptVo> deptList = deptService.getAllDept();
		model.addAttribute("deptList", deptList);
		
		return "taxcal/findDept";
	}
	
	
	
	@RequestMapping("/findOrderCode")
	public String findOrderCode(Model model) {
		
		/*개발 예정*/
		model.addAttribute("developYet", "developYet");
		
		return "taxcal/findOrderCode";
	}
}
