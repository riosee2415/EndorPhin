package kr.or.ddit.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IOrdersDao;
import kr.or.ddit.order.model.OrdersVo;

@Service("ordersService")
public class OrdersService implements IOrdersService{
	
	@Resource(name="ordersDao")
	IOrdersDao ordersDao;

	@Override
	public List<OrdersVo> searchByName(OrdersVo ordersVo) {
		return ordersDao.searchByName(ordersVo);
	}
	
	
}
