package kr.or.ddit.tax_cal.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.constant.SalesCodeConstant;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.tax_cal.service.ITax_calService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class Tax_calController {
	
	private Logger logger = LoggerFactory.getLogger(Tax_calController.class);
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	@Resource(name="deptService")
	private IDeptService deptService;
	
	@Resource(name="tax_calService")
	private ITax_calService tax_calService;
	
	
	// 최초 페이지 뷰
	@RequestMapping(path="taxcalview", method=RequestMethod.GET)
	public String taxcallview(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = tax_calService.selecTax_calPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		model.addAttribute("scCode", SalesCodeConstant.salesCode);
		model.addAttribute("phCode", SalesCodeConstant.purchaseCode);
		
		return "taxcalview";
	}

	
	
	// ajax를 통한 페이징 뷰
	@RequestMapping("/getTax_calPageList")
	public String getTax_calPageList(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = tax_calService.selecTax_calPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "taxcal/taxcalAjaxPaging";
	}
	
	
	
	// Ajax를 통해 거래처 데이터 가져오기
	@RequestMapping("/findClient")
	public String findClient(Model model) {
		List<ClientVo> clientList = clientService.getAllClient(); 
		model.addAttribute("clientList", clientList);
			
		return "taxcal/findClient";
	}
	
	
	
	// Ajax를 통해 부서 데이터 가져오기
	@RequestMapping("/findDept")
	public String findDept(Model model) {
		List<DeptVo> deptList = deptService.getAllDept();
		model.addAttribute("deptList", deptList);
		
		return "taxcal/findDept";
	}
	
	
	// Ajax를 통해 발주번호 데이터 가져오기 (개발예정)
	@RequestMapping("/findOrderCode")
	public String findOrderCode(Model model) {
		
		/*개발 예정*/
		model.addAttribute("developYet", "developYet");
		
		return "taxcal/findOrderCode";
	}
	
	
	// Ajax를 통해 입력폼의 html을 로드
	@RequestMapping("/openInsertViewArea")
	@ResponseBody
	public String openInsertViewArea(	@RequestParam(name="slipDate")String slipDate
								,		@RequestParam(name="supplyValue")String supplyValue
								,		@RequestParam(name="surtax")String surtax
								,		@RequestParam(name="sumValue")String sumValue	
								,		@RequestParam(name="salesStatus")String salesStatus	
								,		@RequestParam(name="clientName")String clientName	
								,		@RequestParam(name="deptName", defaultValue="미등록")String deptName	
								,		@RequestParam(name="OrderCode", defaultValue="")String OrderCode	
								,		@RequestParam(name="auto")String auto	
								,		@RequestParam(name="slipType")String slipType	
			) {
		
		
		
		logger.debug("slipDate : {}", slipDate);
		logger.debug("supplyValue : {}", supplyValue);
		logger.debug("surtax : {}", surtax);
		logger.debug("sumValue : {}", sumValue);
		logger.debug("salesStatus : {}", salesStatus);
		logger.debug("clientName : {}", clientName);
		logger.debug("deptName : {}", deptName);
		logger.debug("OrderCode : {}", OrderCode);
		logger.debug("auto : {}", auto);
		logger.debug("slipType : {}", slipType);
		
		return "Connection";
		
	}
	
	@RequestMapping("/openInsertViewAreaLoad")
	public String openInsertViewAreaLoad(@RequestParam("slipType")String slipType
										,@RequestParam("salesStatus")String salesStatus, Model model) {
			
			model.addAttribute("slipType", slipType);
			model.addAttribute("salesStatus", salesStatus);
			
		return "taxcal/openInsertViewArea";
		
	}
	
	
	
	
}
