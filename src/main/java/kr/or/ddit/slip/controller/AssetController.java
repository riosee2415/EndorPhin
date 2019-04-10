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
	
	//리스트 출력
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
	//모든 데이터 등록
	@RequestMapping("/insertFrm")
	public String insertFrm(Model model, AssetVo assetVo, String assetCode, String assetName,String date,
										String sanggakWay,String accountName,String clientName,String acquisitionPrice,
										String residualvalue,String jukyo,String sanggakCode,
										String depreciation,String accumulated,String purchaseCode,
										String serviceLife ,String depreciationRate){
		
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
		assetVo.setServiceLife(serviceLife);
		assetVo.setDepreciationRate(depreciationRate);
	
		int updAsset = assetService.updateAsset(assetVo);
		
		if(updAsset > 0) {
			return "redirect:/purchaseAsset";
		}else {
			return "redirect:/purchaseAsset";
		}
	}
	 
	//등록
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
	
	//부분 수정
	@RequestMapping("/updateStatusAsset")
	public String updateStatusAsset(AssetVo assetVo, Model model, String assetCode,String acquisitionDate
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
		
		int updAssect = assetService.updateStatusAsset(assetVo);
		
		String data = assetVo.getSanggakWay();
		
		int sanggakWay11 = Integer.parseInt(data);
		
		model.addAttribute("acquisitionPrice",acquisitionPrice);
		model.addAttribute("date",date);
		model.addAttribute("assetCode",assetCode);
		model.addAttribute("purchaseCode",purchaseCode);
		model.addAttribute("sanggakWay",sanggakWay);
	
		AssetVo asset = assetService.selectAsset(assetCode); //상세보기 
		
	
		if(updAssect > 0) {
			
			if( sanggakWay11 > 0){
				model.addAttribute("asset", asset);
				return "asset/modify_straightAjax";
			}else {
				model.addAttribute("declining", SalesCodeConstant.declining);
				model.addAttribute("asset", asset);
				return "asset/modify_decliningAjax";
			}		
		}else {
			model.addAttribute("assetCode",assetCode);
			return "asset/modifyAssetAjax";
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
	
	//계정검색
	@RequestMapping("establishSearch")
	public String establishSearch(Model model,@RequestParam("establishNameKor") String establishNameKor){
		
		List<EstablishVo> establishList = establishService.selectEstablishByNm(establishNameKor);
		
		model.addAttribute("establishList", establishList);
		
		return "asset/establishSearchAjax";
	}
	//거래처 검색
	@RequestMapping(path="/clientSearch", method=RequestMethod.GET)
	public String clientSearch(String cName, Model model) {
		
		List<ClientVo> clientList = clientService.getNameClient(cName);
		model.addAttribute("clientList", clientList);
		
		return "asset/clientSearchAjax";
	}
	
	//고정자산 코드 검색
	@RequestMapping(path="/assetSearch", method=RequestMethod.GET)
	public String assetSearch(@RequestParam("assetCodeS") String assetCode, Model model) {
		
		List<AssetVo> assetList = assetService.searchAsset(assetCode);
		model.addAttribute("assetList", assetList);
		logger.debug("assetCode : {}", assetCode);
		logger.debug("assetList : {}", assetList.size());
		return "asset/assetSearchAjax";
	}
	
	
	//감가상각계정 검색 
	@RequestMapping("sanggakSearch")
	public String sanggakSearch(Model model,String sanggakName){
		
		List<EstablishVo> establishList = establishService.selectEstablishByNm(sanggakName);
		
		model.addAttribute("establishList", establishList);
		
		return "asset/sanggakSearchAjax";
	}
	//등록화면으로 이동
	@RequestMapping("getAssetInsertBtn")
	public String getAssetInsertBtn(Model model){
	
		return "asset/insertAssetAjax";
	}
	
	//수정화면으로 이동 
	@RequestMapping("getAssetModifyBtn")
	public String getAssetModifyBtn(Model model, String assetCode, String acquisitionPrice){
	
		AssetVo asset = assetService.selectAsset(assetCode);
		
		model.addAttribute("asset", asset);
		
		return "asset/modifyAssetAjax";
	}


	//내용연수표 이동
	@RequestMapping(path="serviceLife", method=RequestMethod.GET)
	public String serviceLife(Model model){

		model.addAttribute("straight", SalesCodeConstant.straight);
		return "asset/serviceLife";
		
	}
	
	//삭제 
	@RequestMapping(path="deleteAsset", method=RequestMethod.GET)
	public String deleteAsset(Model model , String assetCode){
		
		assetService.deleteAsset(assetCode);
		
		return "purchaseAsset";
		
	}
	
	//매각
	@RequestMapping(path="sellAsset", method=RequestMethod.GET)
	public String sellAsset(Model model){

		return "sellAsset";
		
	}
	
	
}
