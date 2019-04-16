package kr.or.ddit.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IOrder_detailDao;
import kr.or.ddit.order.dao.IOrdersDao;
import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;

@Service("ordersService")
public class OrdersService implements IOrdersService{
	
	private Logger logger = LoggerFactory.getLogger(OrdersService.class);
	
	@Resource(name="ordersDao")
	IOrdersDao ordersDao;
	
	@Resource(name="order_detailDao")
	IOrder_detailDao order_detailDao;

	@Override
	public List<OrdersVo> searchByName(OrdersVo ordersVo) {
		return ordersDao.searchByName(ordersVo);
	}

	@Override
	public OrdersVo selectOrders(String orderCode) {
		return ordersDao.selectOrders(orderCode);
	}

	@Override
	public void updateAndInsertOrder(String[] quantity, String[] productCode, OrdersVo orderVo) {
		logger.debug("확인 1233 : {} ",orderVo.getOrderCode());
		if(orderVo.getOrderCode().equals("")){
			ordersDao.insertOrders(orderVo);
		}
		else{
			ordersDao.updateOrders(orderVo);
		}
		logger.debug("확인 123 : {} ",orderVo.getOrderCode());
		order_detailDao.deleteOrder_detailByOdcd(orderVo.getOrderCode());
		for (int i = 0; i < quantity.length; i++) {
			order_detailDao.insertOrder_detail(new Order_detailVo((i+1)+"",orderVo.getOrderCode(),quantity[i],productCode[i]));
		}
		ordersDao.updateOrders(orderVo);
	}

	@Override
	public int deleteOrders(String orderCode) {
		return ordersDao.deleteOrders(orderCode);
	}
	
}
