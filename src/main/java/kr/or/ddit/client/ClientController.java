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
		
		List<ClientVo> clientList = clientService.getCodeClient(cCode);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	
	@RequestMapping(path="/seachNameClient", method=RequestMethod.GET)
	public String seachNameClient(@RequestParam("cName")String cName, Model model) {
		
		List<ClientVo> clientList = clientService.getNameClient(cName);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	@RequestMapping(path="/seachBothClient", method=RequestMethod.GET)
	public String seachBothClient(@RequestParam("BothName")String BothName
								, @RequestParam("BothCode")String BothCode
								, Model model) {
		
		List<ClientVo> clientList = clientService.getBothClient(BothName, BothCode);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	
    
    
	@RequestMapping(path="/insertClient", method=RequestMethod.GET)
	public String insertClient(	@RequestParam(name="frmClCode", defaultValue="9999")String clientCode
							, 	@RequestParam(name="frmClName", defaultValue="미등록")String clientName
							, 	@RequestParam(name="frmClSalesNumber", defaultValue="9999")String salesNumber
							, 	@RequestParam(name="frmClManager", defaultValue="미등록")String manager
							, 	@RequestParam(name="frmClTelephone", defaultValue="미등록")String telephone
							, 	@RequestParam(name="frmClFaxNumber", defaultValue="9999")String faxNumber
							, 	@RequestParam(name="frmClManagerEmail", defaultValue="미등록")String managerEmail
							, 	@RequestParam(name="frmClBusinessType", defaultValue="미등록")String businessType
							, 	@RequestParam(name="frmClPlace", defaultValue="미등록")String place
							, 	@RequestParam(name="frmClBusiness", defaultValue="미등록")String business
							, 	@RequestParam(name="frmClBankname", defaultValue="미등록")String bankName
							, 	@RequestParam(name="frmClAccountNumber", defaultValue="9999")String accountNumber
							, 	@RequestParam(name="frmClRelate", defaultValue="미등록")String relate
							,	Model model) { 
		
		
		logger.debug("businessType : {}" , businessType);
		
		ClientVo clientVo = new ClientVo();
		
		clientVo.setClientCode(clientCode);
		clientVo.setClientName(clientName);
		clientVo.setSalesNumber(salesNumber);
		clientVo.setManager(manager);
		clientVo.setTelephone(telephone);
		clientVo.setFaxNumber(faxNumber);
		clientVo.setManagerEmail(managerEmail);
		clientVo.setBusinessType(businessType);
		clientVo.setPlace(place);
		clientVo.setBusiness(business);
		clientVo.setBankName(bankName);
		clientVo.setAccountNumber(accountNumber);
		clientVo.setRelate(relate);
		
		int cnt = clientService.insertClient(clientVo);
		
			
		return "redirect:/clientview";
	}
	
	

}














