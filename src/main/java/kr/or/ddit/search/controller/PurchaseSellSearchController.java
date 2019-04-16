package kr.or.ddit.search.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.tax_cal.service.ITax_calService;

@Controller
public class PurchaseSellSearchController {
	
	private Logger logger = LoggerFactory.getLogger(PurchaseSellSearchController.class);
	
	@Resource(name="tax_calService")
	private ITax_calService tax_calService;
	
	
	@RequestMapping(path="psList", method=RequestMethod.GET)
	public String PSList() {
		
		
		return "psList";
	}
	
	
	// 유형별 전체조회
	@RequestMapping("/searchAllByType")
	public String searchAllByType(	@RequestParam("searchData1")String searchData1,
									@RequestParam("searchData2")String searchData2,
									Model model) {
			
		
		List<Tax_calVo> taxList = new ArrayList<>();
		
		if(searchData1.equals("매입")) {
			taxList = tax_calService.searchAllByType();
		} else if (searchData1.equals("매출") ) {
			taxList = tax_calService.searchAllByType2();
		}
	
		
		model.addAttribute("taxList", taxList);
		
		return "ps/searchResultList";
	}
	

}
