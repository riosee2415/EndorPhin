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

import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.order.service.IOrder_detailService;
import kr.or.ddit.order.service.IOrdersService;
import kr.or.ddit.product.service.IProductService;

@RequestMapping(path="/orders")
@Controller
public class OrderController {
	
	private Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource(name="ordersService")
	IOrdersService ordersService;
	
	@Resource(name="order_detailService")
	IOrder_detailService order_detailService;
	
	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@Resource(name="deptService")
	IDeptService deptService;
	
	@Resource(name="clientService")
	ICilentService clientService;
	
	@Resource(name="productService")
	IProductService productService;
	
	@RequestMapping(path="/orderInput")
	public String orderInput(OrdersVo ordersVo,Model model){
		List<OrdersVo> searchByName = ordersService.searchByName(ordersVo);
		model.addAttribute("orderList",searchByName);
		model.addAttribute("clientList", clientService.getAllClient());
		model.addAttribute("employeeList", employeeService.getAllEmployee());
		model.addAttribute("deptList", deptService.getAllDept());
		return "orderInput";
	}
	
	@RequestMapping(path="/currentOrder")
	public String currentOrder(){
		return "currentOrder";
	}
	
	@RequestMapping(path="/selectModal")
	@ResponseBody
	public Map<String, Object> selectModal(String check){
		Map<String, Object> map = new HashMap<>();
		switch (check) {
			case "0":
				map.put("deptList", deptService.getAllDept());
				break;
			case "1":
				map.put("employeeList", employeeService.getAllEmployee());
				break;
			default:
				map.put("clientList", clientService.getAllClient());
				break;
		}
		return map;
	}
	
	@RequestMapping(path="/selectOrder")
	@ResponseBody
	public Map<String, Object> selectOrder(String orderCode){
		Map<String, Object> map = new HashMap<>();
		map.put("orderVo", ordersService.selectOrders(orderCode));
		map.put("detailList", order_detailService.getOrder_detailByOrdercd(orderCode));
		return map;
	}
	
	@RequestMapping(path="/searchProduct")
	@ResponseBody
	public Map<String, Object> searchProduct(String productName){
		Map<String, Object> map = new HashMap<>();
		map.put("productList", productService.searchByName(productName));
		return map;
	}
	
}
