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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.order.service.IOrder_detailService;
import kr.or.ddit.order.service.IOrdersService;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.IReceiveService;

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
	
	@Resource(name="receiveService")
	IReceiveService receiveService;
	
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
	public String currentOrder(OrdersVo ordersVo,Model model){
		List<OrdersVo> searchByName = ordersService.searchByName(ordersVo);
		model.addAttribute("orderList",searchByName);
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
	public Map<String, Object> selectOrder(String orderCode,boolean check){
		Map<String, Object> map = new HashMap<>();
		map.put("orderVo", ordersService.selectOrders(orderCode));
		map.put("detailList", order_detailService.getOrder_detailByOrdercd(orderCode));
		if(check){
			map.put("receiveDetail", receiveService.selectReceiveNdetail(orderCode));
		}
		return map;
	}
	
	@RequestMapping(path="/searchProduct")
	@ResponseBody
	public Map<String, Object> searchProduct(String productName){
		Map<String, Object> map = new HashMap<>();
		map.put("productList", productService.searchByName(productName));
		return map;
	}
	
	@RequestMapping(path="/insertOrder",method=RequestMethod.POST)
	public String insertOrder(String[] quantity,String[] productCode,OrdersVo orderVo){
		ordersService.updateAndInsertOrder(quantity, productCode, orderVo);
		return "redirect:/orders/orderInput";
	}
	@RequestMapping(path="/deleteOrder",method=RequestMethod.POST)
	public String deleteOrder(String[] orderCode){
		for (int i = 0; i < orderCode.length; i++) {
			ordersService.deleteOrders(orderCode[i]);
		}
		return "redirect:/orders/orderInput";
	}
	@RequestMapping(path="/searchOrder_detail")
	@ResponseBody
	public Map<String, Object> searchOrder_detail(String orderCode){
		Map<String, Object> map = new HashMap<>();
		map.put("detail", order_detailService.getOrder_detailByOrdercd(orderCode));
		return map;
	}
	
}
