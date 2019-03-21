package kr.or.ddit.client;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ICilentService;

@Controller()
public class ClientController {
	
	private Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	
	/**
	* Method : clientView
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 데이터를 전부 불러온다.
	*/
	@RequestMapping(path="/clientview", method=RequestMethod.GET)
	public String clientView(Model model) {
		
		List<ClientVo> clientList = clientService.getAllClient();
		model.addAttribute("clientList", clientList);
			
		return "clientview";
	}
	
	
	@RequestMapping(path="/seachCodeClient", method=RequestMethod.GET)
	public String seachCodeClient(@RequestParam("cCode")String cCode, Model model) {
		logger.debug("cCode : {}" , cCode);	
		
		List<ClientVo> clientList = clientService.getCodeClient(cCode);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	
	@RequestMapping(path="/seachNameClient", method=RequestMethod.GET)
	public String seachNameClient(@RequestParam("cName")String cName, Model model) {
		logger.debug("cName : {}" , cName);	
		
		List<ClientVo> clientList = clientService.getNameClient(cName);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	@RequestMapping(path="/seachBothClient", method=RequestMethod.GET)
	public String seachBothClient(@RequestParam("BothName")String BothName
								, @RequestParam("BothCode")String BothCode) {
		
		logger.debug("BothName : {}" , BothName);	
		logger.debug("BothCode : {}" , BothCode);
		
		return "clientview";
	}

}
