package kr.or.ddit.product.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.model.WareHouseVo;
import kr.or.ddit.product.service.IWareHouseService;

@RequestMapping("/wareHouse")
@Controller
public class WareHouseController {
	@Resource(name="wareHouseService")
	IWareHouseService wareHouseService;
	
	@RequestMapping(path="/getAllWareHouse")
	public String getAllWareHouse(Model model){
		model.addAttribute("allWareHouse",wareHouseService.getAllWarehouse());
		return "wareHouseTiles";
	}
	
	@RequestMapping(path = "/findWareHouseCode", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public WareHouseVo findWareHouseCode(Model model, String wareHouseCode) {
		WareHouseVo selectWarehouse = wareHouseService.selectWarehouse(wareHouseCode);
		return selectWarehouse;
	}
	
	@RequestMapping(path="/updateWareHouse")
	public String updateWareHouse(WareHouseVo wareHouseVo){
		wareHouseService.updateWarehouse(wareHouseVo);
		return "redirect:/wareHouse/getAllWareHouse";
	}
}
