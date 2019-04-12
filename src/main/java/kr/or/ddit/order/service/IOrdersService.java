package kr.or.ddit.order.service;

import java.util.List;

import kr.or.ddit.order.model.OrdersVo;

public interface IOrdersService {
	List<OrdersVo> searchByName(OrdersVo ordersVo);
	OrdersVo selectOrders(String orderCode);
}
