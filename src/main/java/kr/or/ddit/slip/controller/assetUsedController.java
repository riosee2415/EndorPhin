package kr.or.ddit.slip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.service.IAssetService;
import kr.or.ddit.tax_cal.service.IEstablishService;

@Controller
public class assetUsedController {
	
	private Logger logger = LoggerFactory.getLogger(assetUsedController.class);
	
	@Resource(name="assetService")
	private IAssetService assetService;
	
	@Resource(name="establishService")
	private IEstablishService establishService;
	
	@RequestMapping("assetUsed")
	public String ListDepreciation(Model model) {
		
		List<AssetVo> depreciationList = assetService.getAllAsset();
		
		model.addAttribute("depreciationList", depreciationList);
		
		return"assetUsed";
	}
	
	@RequestMapping("assetDateSearch")
	public String assetDateSearch(Model model , String accountName , String acquisitionDate) {
		
		List<AssetVo> depreciationList = assetService.searchDateAsset(accountName, acquisitionDate);
		
		model.addAttribute("depreciationList", depreciationList);
		
		logger.debug("accountName:{}",accountName);
		logger.debug("acquisitionDate:{}",acquisitionDate);
		
		return "assetUsed/assetDateSearchAjax";
	}
}
