package kr.or.ddit.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {

	@RequestMapping(path="/payment")
	public String paymentList(){
		return "paymentView";
	}
}
