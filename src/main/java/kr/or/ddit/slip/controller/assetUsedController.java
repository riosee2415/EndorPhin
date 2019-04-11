package kr.or.ddit.slip.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.service.IAssetService;
import kr.or.ddit.slip.service.ISlipService;

@Controller
public class assetUsedController {
	
	private Logger logger = LoggerFactory.getLogger(assetUsedController.class);
	
	@Resource(name="assetService")
	private IAssetService assetService;
	
	@Resource(name="slipService")
	private ISlipService slipService;
	
	
	@RequestMapping("assetUsed")
	public String ListDepreciation(Model model) {
		
		List<AssetVo> depreciationList = assetService.getAllAsset();
		
		model.addAttribute("depreciationList", depreciationList);
		
		return "assetUsed";
	}
	
	//날짜 검색
	@RequestMapping("assetDateSearch")
	public String assetDateSearch(Model model , String accountName , String acquisitionDate) {
		
		List<AssetVo> depreciationList = assetService.searchDateAsset(accountName, acquisitionDate);
		
		model.addAttribute("depreciationList", depreciationList);
		
		return "assetUsed/assetDateSearchAjax";
	}

	@RequestMapping("insertslipApply")
	public String slipInsertApply(SlipVo slipVo,String acquisitionDate,Model model) throws ParseException {
		
		Date date = new Date();									
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy/MM/dd");
        date= sdf1.parse(acquisitionDate);
		
		slipVo.setTotal("000");
		slipVo.setDepartmentName("미등록");
		slipVo.setJukyo("미등록");
		slipVo.setStatus("0");
	    slipVo.setSlipDate(date);
	    
		slipService.insertSlip(slipVo);
	
		String currval = slipService.currvalSeq();
		logger.debug("currval:{}",currval);
		
		int slipNumber = slipService.getSlipCnt();
		slipNumber++;
		model.addAttribute("slipNumber", slipNumber);
		
		
		return "assetUsed";
	}
	
	
}
