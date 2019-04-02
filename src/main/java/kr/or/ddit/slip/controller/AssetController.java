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

import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.service.IAssetService;

@Controller
public class AssetController {

	private Logger logger = LoggerFactory.getLogger(AssetController.class);
	
	@Resource(name="assetService")
	private IAssetService assetService;
	
	@RequestMapping("/purchaseAsset")
	public String purchaseAsset(Model model){
		
		
		List<AssetVo> assetList = assetService.getAllAsset();
		
		model.addAttribute("assetList", assetList);
		
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
}
