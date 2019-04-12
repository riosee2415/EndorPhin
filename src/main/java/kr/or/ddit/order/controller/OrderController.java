package kr.or.ddit.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.IOrder_detailService;
import kr.or.ddit.order.service.IOrdersService;

@RequestMapping(path="/orders")
@Controller
public class OrderController {
	
	private Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource(name="ordersService")
	IOrdersService ordersService;
	
	@Resource(name="order_detailService")
	IOrder_detailService order_detailService;
	
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
	
	@RequestMapping(path="/selectOrder")
	@ResponseBody
	public Map<String, Object> selectOrder(String orderCode){
		Map<String, Object> map = new HashMap<>();
		OrdersVo selectOrders = ordersService.selectOrders(orderCode);
		List<Order_detailVo> order_detailByOrdercd = order_detailService.getOrder_detailByOrdercd(orderCode);
		map.put("orderVo", selectOrders);
		map.put("detailList", order_detailByOrdercd);
		return map;
	}
}
