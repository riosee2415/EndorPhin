package kr.or.ddit.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.IOrdersService;

@RequestMapping(path="/orders")
@Controller
public class OrderController {
	
	private Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource(name="ordersService")
	IOrdersService ordersService;
	
	@RequestMapping(path="/orderInput")
	public String orderInput(OrdersVo ordersVo,Model model){
		List<OrdersVo> searchByName = ordersService.searchByName(ordersVo);
		logger.debug("확인:{}",searchByName.get(0).getOrderCode());
		model.addAttribute("orderList",searchByName);
		return "orderInput";
	}
	
	@RequestMapping(path="/currentOrder")
	public String currentOrder(){
		return "currentOrder";
	}
}
