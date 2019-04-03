package kr.or.ddit.tax_cal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.constant.SalesCodeConstant;

@Controller
public class Tax_calController {
	
	@RequestMapping(path="taxcallview", method=RequestMethod.GET)
	public String taxcallview(Model model) {
		
		model.addAttribute("scCode", SalesCodeConstant.salesCode);
		model.addAttribute("phCode", SalesCodeConstant.purchaseCode);
		
		return "taxcallview";
	}

}
