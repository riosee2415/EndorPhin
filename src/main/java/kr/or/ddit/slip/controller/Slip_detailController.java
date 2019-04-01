package kr.or.ddit.slip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.slip.service.ISlip_detailService;

@Controller
public class Slip_detailController {
	
	private Logger logger = LoggerFactory.getLogger(Slip_detailController.class);
	
	@Resource(name="slip_detailService")
	private ISlip_detailService slip_detailService;
	
	@Resource(name="slipService")
	private ISlipService slipService;
	
	
	@RequestMapping("/insertDetailSlip")
	public String insertDetailSlip(	@RequestParam(name="slipDetailNo")String  slipDetailNo
								,	@RequestParam(name="status")String  status
								,	@RequestParam(name="price")String  price
								,	@RequestParam(name="clientCard")String  clientCard
								,	@RequestParam(name="slipNumber")String  slipNumber
								,	@RequestParam(name="establishCode")String  establishCode
								,	@RequestParam(name="currval")String  currval
								,	@RequestParam(name="insertSlipDate")String  insertSlipDate
								,	@RequestParam(name="insertDept", defaultValue="미등록")String  insertDept
								,	Model model) {
		
		
		
		
		String[] establishCodeArr = establishCode.split("_");
		String[] clientCardArr = clientCard.split("_");
		
		
		Slip_detailVo dvo = new Slip_detailVo();
		
		dvo.setSlipDetailNo(slipDetailNo);
		dvo.setStatus(status);
		dvo.setPrice(price);
		dvo.setClientCard(clientCardArr[1]);
		dvo.setSlipNumber(currval);
		dvo.setEstablishCode(establishCodeArr[0]);
		
		slip_detailService.insertDetailSlip(dvo);
		
		List<Slip_detailVo> slip_detailList = slip_detailService.getSlip_detailBySlipNumber(currval);
		
		
		
		model.addAttribute("slip_detailList", slip_detailList);
		model.addAttribute("currval", currval);
		model.addAttribute("slipDate", insertSlipDate);
		model.addAttribute("insertDept", insertDept);
		

		
		return "slip_detail/slip_detailInsert";
	}
	
	
	
	@RequestMapping("/deleteSlip_detail")
	@ResponseBody
	public String deleteSlip_detail(@RequestParam("slipNumber")String slipNumber) {
		
		
		slip_detailService.deleteSlip_detail(slipNumber);
		slipService.deleteSlip(slipNumber);
		
		return "입력중이던 전표가 삭제되었습니다.";
	}
}
