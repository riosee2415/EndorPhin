package kr.or.ddit.payment.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.service.IPaymentService;

@Controller
public class PaymentController {

	@Resource(name="paymentService")
	IPaymentService paymentService;
	
	@RequestMapping(path="/payment")
	public String paymentList(){
		return "paymentView";
	}
	
	@RequestMapping(path="/addPayment")
	public String addPayment(HttpSession session,Model model){
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		List<PaymentVo> payment_u = paymentService.getPayment_u(employeeVo.getUserId());
		model.addAttribute("paymentList",payment_u);
		return "addPaymentView";
	}
}
