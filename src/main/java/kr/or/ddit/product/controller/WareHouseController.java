package kr.or.ddit.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.model.WareHouseVo;
import kr.or.ddit.product.service.IReceiveService;
import kr.or.ddit.product.service.IReceive_detailService;
import kr.or.ddit.product.service.IWareHouseService;

@RequestMapping("/wareHouse")
@Controller
public class WareHouseController {
	@Resource(name="wareHouseService")
	IWareHouseService wareHouseService;
	
	@Resource(name="receiveService")
	IReceiveService receiveService;
	
	@Resource(name="receive_detailService")
	IReceive_detailService receive_detailService;
	
	
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
	
	@RequestMapping(path="/getAllReceive")
	public String getAllReceive(Model model,String preDate,String postDate){
		Map<String, Object> map= new HashMap<>();
		if(preDate!=null){
			map.put("preDate", preDate);
			map.put("postDate", postDate);
		}
		model.addAttribute("receiveList",receiveService.getAllReceive(map));
		return "receiveInput";
	}
	
	@RequestMapping(path="/findReceive")
	@ResponseBody
	public Map<String,Object> findReceive(String receiveCode){
		Map<String,Object> map = new HashMap<>();
		map.put("receiveCode", receiveCode);
		map.put("receiveVo", receiveService.getAllReceive(map).get(0));
		map.put("receiveDetailList", receive_detailService.getReceive_detail(receiveCode));
		return map;
	}
}
