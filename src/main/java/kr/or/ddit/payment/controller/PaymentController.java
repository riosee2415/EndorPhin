package kr.or.ddit.payment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.payment.service.IDe_Product_divService;
import kr.or.ddit.payment.service.IPaymentService;
import kr.or.ddit.payment.service.IPayment_DetailService;

@Controller
public class PaymentController {

	private Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Resource(name="paymentService")
	IPaymentService paymentService;
	
	@Resource(name="de_product_divService")
	IDe_Product_divService de_product_divService;
	
	@Resource(name="payment_detailService")
	IPayment_DetailService payment_detailService;
	
	@RequestMapping(path="/payment")
	public String paymentList(){
		return "paymentView";
	}
	
	@RequestMapping(path="/getPaymentList",method=RequestMethod.GET, produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> getPaymentList(String userid){
		Map<String, Object> deNmPayList = payment_detailService.getDeNmPayList(userid);
		return deNmPayList;
	}
	
	@RequestMapping(path="/addProduct",method=RequestMethod.GET)
	public String addProduct(Model model,De_product_divVo de_product_divVo,String searchDeductName){
		if(searchDeductName==null){
			List<De_product_divVo> allDe_product_div = de_product_divService.getDe_product_div("1");
			model.addAttribute("allDe_product_div",allDe_product_div);
		}
		else{
			de_product_divVo.setDeductName(searchDeductName);
			List<De_product_divVo> selectDeproductByNm = de_product_divService.selectDeproductByNm(de_product_divVo);
			model.addAttribute("allDe_product_div",selectDeproductByNm);
			
		}
		return "addProductView";
	}
	
	@RequestMapping(path="/addDeduct",method=RequestMethod.GET)
	public String addDeduct(Model model,De_product_divVo de_product_divVo,String searchDeductName){
		if(searchDeductName==null){
			List<De_product_divVo> allDe_product_div = de_product_divService.getDe_product_div("2");
			model.addAttribute("allDe_product_div",allDe_product_div);
		}
		else{
			de_product_divVo.setDeductName(searchDeductName);
			List<De_product_divVo> selectDeproductByNm = de_product_divService.selectDeproductByNm(de_product_divVo);
			model.addAttribute("allDe_product_div",selectDeproductByNm);
			
		}
		return "addDeductView";
	}
	
	@RequestMapping(path="/delDeproduct",method=RequestMethod.GET)
	public String delDeproduct(Model model,String[] deductCode,String deprostatus){
		for (String str : deductCode) {
			de_product_divService.deleteDe_product_div(str);
		}
		if(deprostatus.equals("1")){
			return "redirect:/addProduct";
		}
		else{
			return "redirect:/addDeduct";
		}
	}
	@RequestMapping(path="/addDeproduct",method=RequestMethod.POST)
	public String addDeproduct_post(Model model,De_product_divVo de_product_divVo){
		de_product_divService.insertDe_product_div(de_product_divVo);
		logger.debug("selectDe_product_div:{}",de_product_divVo);
		if(de_product_divVo.getDeprostatus().equals("1")){
			return "redirect:/addProduct";
		}
		else{
			return "redirect:/addDeduct";
		}
	}
	@RequestMapping(path="/findDeductCode",method=RequestMethod.GET)
	@ResponseBody
	public String findDeductCode(Model model,String deductCode){
		logger.debug("deductCode: {}",deductCode);
		De_product_divVo selectDe_product_div = de_product_divService.selectDe_product_div(deductCode);
		if (selectDe_product_div==null) {
			return "1"; // 중복 x
		}
		else{
			return "2"; // 중복
		}
	}
	@RequestMapping(path="/findDeductCode",method=RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public De_product_divVo findDeductCode_post(Model model, De_product_divVo selectDe_product_div){
		selectDe_product_div = de_product_divService.selectDe_product_div(selectDe_product_div.getDeductCode());
		return selectDe_product_div;
	}
	
	@RequestMapping(path="/updDeduct",method=RequestMethod.GET)
	public String updDeduct(De_product_divVo selectDe_product_div){
		de_product_divService.updateDe_product_div(selectDe_product_div);
		if(selectDe_product_div.getDeprostatus().equals("1")){
			return "redirect:/addProduct";
		}
		else{
			return "redirect:/addDeduct";
		}
	}
	
	@RequestMapping(path="/addPayment",method=RequestMethod.GET)
	public String addPaymentView(String searchPaymentName,Model model){
		List<PaymentVo> paymentList = null ;
		if(searchPaymentName==null){
			paymentList=paymentService.getPaymentList();
		}else{
			paymentList=paymentService.getPaymentListByUserNm(searchPaymentName);
		}
		model.addAttribute("paymentList",paymentList);
		return "addPaymentView";
	}
	
	
}
