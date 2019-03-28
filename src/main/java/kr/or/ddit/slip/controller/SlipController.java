package kr.or.ddit.slip.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class SlipController {

	@Resource(name="slipService")
	private ISlipService slipService;
	
	
	@RequestMapping("/slipview")
	public String slipView(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipview";
	}
	
	@RequestMapping("/getSlipPageList")
	public String getSlipPageList(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slip/slipAjaxHtml";
	}
	
	@RequestMapping("/getSlipInsertBtn")
	public String getSlipInsertBtn() {
		
		return "slip/insertSlipAjax";
	}
}
