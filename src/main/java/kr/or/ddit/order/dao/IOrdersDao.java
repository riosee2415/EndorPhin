package kr.or.ddit.order.dao;

import java.util.List;

import kr.or.ddit.order.model.OrdersVo;

public interface IOrdersDao {
	List<OrdersVo> searchByName(OrdersVo ordersVo);
}
