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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.constant.SalesCodeConstant;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.service.IAssetService;
import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.tax_cal.service.IEstablishService;

@Controller
public class AssetController {

	private Logger logger = LoggerFactory.getLogger(AssetController.class);
	
	@Resource(name="assetService")
	private IAssetService assetService;
	
	@Resource(name="establishService")
	private IEstablishService establishService;
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	@RequestMapping("/purchaseAsset")
	public String purchaseAsset(Model model){
		
		
		List<AssetVo> assetList = assetService.getAllAsset();
		List<EstablishVo> establishList = establishService.getAllEstablish();
		List<ClientVo> clientList = clientService.getAllClient();
		
		model.addAttribute("assetList", assetList);
		model.addAttribute("establishList", establishList);
		model.addAttribute("clientList", clientList);
		
		return "purchaseAsset";
	}
	@RequestMapping("/insertFrm")
	public String insertFrm(Model model, AssetVo assetVo, String assetCode, String assetName,String date,
										String sanggakWay,String accountName,String clientName,String acquisitionPrice,
										String residualvalue,String jukyo,String sanggakCode,
										String depreciation,String accumulated,String purchaseCode){
		
		Date acquisitionDate = new Date();									
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		try {
			acquisitionDate= sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		assetVo.setAssetCode(assetCode);
		assetVo.setAssetName(assetName);
		assetVo.setAcquisitionDate(acquisitionDate);
		assetVo.setAccountName(accountName);
		assetVo.setClientName(clientName);
		assetVo.setSanggakWay(sanggakWay);
		assetVo.setAcquisitionPrice(acquisitionPrice);
		assetVo.setResidualvalue(residualvalue);
		assetVo.setJukyo(jukyo);
		assetVo.setSanggakCode(sanggakCode);
		assetVo.setDepreciation(depreciation);
		assetVo.setPurchaseCode(purchaseCode);
		assetVo.setAccumulated(accumulated);
	
		logger.debug("updAsset:---{}",accountName);
		logger.debug("updAsset:---{}",residualvalue);
		
		
		int updAsset = assetService.updateAsset(assetVo);
		
		if(updAsset > 0) {
			return "redirect:/purchaseAsset";
		}else {
			return "redirect:/purchaseAsset";
		}
	}
	 
	@RequestMapping("/insertStatusFrm")
	public String insertStatusAsset(AssetVo assetVo, Model model, String assetCode,String acquisitionDate
																,String sanggakWay,String acquisitionPrice
																,String purchaseCode){
															
		Date date = new Date();									
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		try {
			date= sdf.parse(acquisitionDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		assetVo.setAssetCode(assetCode);
		assetVo.setAcquisitionDate(date);
		assetVo.setPurchaseCode(purchaseCode);
		assetVo.setSanggakWay(sanggakWay);
		assetVo.setAcquisitionPrice(acquisitionPrice);
		
		
		int insertUpd = assetService.insertStatusAsset(assetVo);
		
		String data = assetVo.getSanggakWay();
		
		int sanggakWay11 = Integer.parseInt(data);
		
		model.addAttribute("acquisitionPrice",acquisitionPrice);
		model.addAttribute("date",date);
		model.addAttribute("assetCode",assetCode);
		model.addAttribute("purchaseCode",purchaseCode);
		model.addAttribute("sanggakWay",sanggakWay);
		
		if(insertUpd > 0) {
			
			if( sanggakWay11 > 0){
				return "asset/straightAjax";
			}else {
				model.addAttribute("declining", SalesCodeConstant.declining);
				return "asset/decliningAjax";
			}		
		}else {
			model.addAttribute("assetCode",assetCode);
			return "asset/insertAssetAjax";
		}
	}
	
	//자산코드 중복체크 
	@RequestMapping(path="/DupleAsset", method=RequestMethod.POST)
	@ResponseBody
	public String DuplAsset(@RequestParam(name="assetCode",defaultValue="empty") String assetCode){
		
		List<AssetVo> assetList = assetService.getAllAsset();
		
		String dupleCode = "0"; // 중복 안될 때
		
		for(int i = 0; i < assetList.size(); i++){
			if(assetCode.equals(assetList.get(i).getAssetCode())){
				dupleCode = "1";
				return dupleCode;
			}else if(assetCode.equals("empty")){
				dupleCode = "empty";
				return dupleCode;
			}
		}
		return dupleCode;
	}
	
	@RequestMapping("establishSearch")
	public String establishSearch(Model model,@RequestParam("establishNameKor") String establishNameKor){
		
		List<EstablishVo> establishList = establishService.selectEstablishByNm(establishNameKor);
		
		model.addAttribute("establishList", establishList);
		
		return "asset/establishSearchAjax";
	}
	
	@RequestMapping("getAssetInsertBtn")
	public String getAssetInsertBtn(Model model){
	
		return "asset/insertAssetAjax";
	}

	@RequestMapping(path="serviceLife", method=RequestMethod.GET)
	public String serviceLife(Model model){

		model.addAttribute("straight", SalesCodeConstant.straight);
		return "asset/serviceLife";
		
	}
	
}
