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

	// 고정자산등록 
	@RequestMapping("/insertAsset")
	public String insertAsset(AssetVo assetVo, Model model, @RequestParam("frmAssetCode") String frmAssetCode 
															,@RequestParam("frmAssetName") String frmAssetName
															,@RequestParam("frmAcquisitionDate") String frmAcquisitionDate
															,@RequestParam("frmAccountName") String frmAccountName
															,@RequestParam("frmClientName") String frmClientName
															,@RequestParam("frmSanggakWay") String frmSanggakWay
															,@RequestParam("frmAcquisitionPrice") String frmAcquisitionPrice
															,@RequestParam("frmResidualvalue") String frmResidualvalue
															,@RequestParam(name="frmUnit", defaultValue="") String frmUnit
															,@RequestParam(name="frmJukyo", defaultValue="") String frmJukyo
															,@RequestParam(name="frmUnitprice", defaultValue="") String frmUnitprice
															,@RequestParam(name="frmQuantity", defaultValue="") String frmQuantity
															,@RequestParam("frmSanggakCode") String frmSanggakCode) throws ParseException{
		Date date = new Date();									
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		date= sdf.parse(frmAcquisitionDate);
		assetVo.setAssetCode(frmAssetCode);
		assetVo.setAssetName(frmAssetName);
		assetVo.setAcquisitionDate(date);
		assetVo.setAccountName(frmAccountName);
		assetVo.setClientName(frmClientName);
		assetVo.setSanggakWay(frmSanggakWay);
		assetVo.setAcquisitionPrice(frmAcquisitionPrice);
		assetVo.setResidualvalue(frmResidualvalue);
		assetVo.setUnit(frmUnit);
		assetVo.setJukyo(frmJukyo);
		assetVo.setUnitPrice(frmUnitprice);
		assetVo.setQuantity(frmQuantity);
		assetVo.setSanggakCode(frmSanggakCode);
		
		logger.debug("assetVo : {} ",assetVo);
		int insertUpd = assetService.insertAsset(assetVo);
		
		if(insertUpd > 0){
			return "redirect:/purchaseAsset";
		}else{
			return "redirect:/purchaseAsset";
		}
	}
	 
	@RequestMapping("/insertStatusFrm")
	public String insertStatusAsset(AssetVo assetVo, Model model, @RequestParam("assetCode") String assetCode 
															,@RequestParam("acquisitionDate") String acquisitionDate
															,@RequestParam("purchaseCode") String purchaseCode
															,@RequestParam("sanggakWay") String sanggakWay
															,@RequestParam("acquisitionPrice") String acquisitionPrice){
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
		
		logger.debug("assetCode1111 : {} ", assetCode);
		
		int insertUpd = assetService.insertStatusAsset(assetVo);
		
		String data = assetVo.getSanggakWay();
		
		int sanggakWay11 = Integer.parseInt(data);
		
		logger.debug("data : {} ", data);
		
		if(sanggakWay11 == 1){
			return "asset/straightAjax";
		}else{
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
		
		logger.debug("establishNameKor :::{}",establishNameKor);
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
	/*@RequestMapping("getSamgakk")
	public String getSamgakk(Model model){

		
		
		return "asset/getSamgakk";
	}
	*/

	
}
