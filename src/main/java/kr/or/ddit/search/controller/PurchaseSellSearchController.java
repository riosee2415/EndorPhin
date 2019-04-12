package kr.or.ddit.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PurchaseSellSearchController {
	
	
	@RequestMapping(path="psList", method=RequestMethod.GET)
	public String PSList() {
		
		
		return "psList";
	}
	

}
