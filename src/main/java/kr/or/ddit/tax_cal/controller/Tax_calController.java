package kr.or.ddit.tax_cal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Tax_calController {
	
	@RequestMapping(path="taxcallview", method=RequestMethod.GET)
	public String taxcallview() {
		
		return "taxcallview";
	}

}
