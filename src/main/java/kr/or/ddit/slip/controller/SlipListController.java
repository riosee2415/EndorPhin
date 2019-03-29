package kr.or.ddit.slip.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class SlipListController {
	private Logger logger = LoggerFactory.getLogger(SlipListController.class);
	
	@Resource(name="slipService")
	private ISlipService slipService;

	@RequestMapping("/approval")
	public String approval(PageVo pageVo, Model model) {

		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "approval";
	}
	@RequestMapping("/approvalPageList")
	public String approvalPageList(PageVo pageVo, Model model) {

		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipList/approvalAjaxHtml";
	}

	@RequestMapping("/paaprovuar")
	public String paaprovuar(PageVo pageVo, Model model) {

		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "paaprovuar";
	}
	@RequestMapping("/paaprovuarPageList")
	public String paaprovuarPageList(PageVo pageVo, Model model) {

		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipList/paaprovuarAjaxHtml";
	}
	
	@RequestMapping("/updateSlip")
	public String updateSlip(Model model, @RequestParam("checkRow") String checkRow ){

		String[] arrIdx = checkRow.toString().split(",");
	
		   logger.debug("arrIdx:: : {}", arrIdx);
	    
        for (int i=0; i<arrIdx.length; i++) {
        	
		    int updCnt = slipService.updateSlip(arrIdx[i]);
		}
		
		return "redirect:/approval";
	}
	
	//날짜 검색
	@RequestMapping("/searchAjax")
	public String search_Date(SlipVo slipVo, @RequestParam("before_slipDate")String before_slipDate,
											@RequestParam("after_slipDate")String after_slipDate, Model model, PageVo pageVo) {
		
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		
		List<SlipVo> dateList = slipService.getBetweenSlip(before_slipDate,after_slipDate);
		model.addAttribute("dateList ", dateList);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		
		logger.debug("before_slipDate:{}",before_slipDate);
		logger.debug("after_slipDate:{}",after_slipDate);
		
		return "slipList/search_approvalAjax";
	}
	
}
