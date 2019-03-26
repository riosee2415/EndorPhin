package kr.or.ddit.establish;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.tax_cal.service.IEstablishService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class EstablishController {
	
	@Resource(name="establishService")
	private IEstablishService establishService;
	
	
	
	@RequestMapping(path="/establishview", method=RequestMethod.GET)
	public String establishView(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		
		return "establishview";
	}

	@RequestMapping("/establishAjaxHtml")
	public String establishAjaxHtml(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "establish/establishAjaxHtml";
	}
	
	
	@RequestMapping("/getEstablishPageList")
	public String getEstablishPageList(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "establish/establishAjaxHtml";
	}

}
