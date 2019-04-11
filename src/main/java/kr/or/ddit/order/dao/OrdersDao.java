package kr.or.ddit.order.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.order.model.OrdersVo;

@Repository("ordersDao")
public class OrdersDao implements IOrdersDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrdersVo> searchByName(OrdersVo ordersVo) {
		return sqlSessionTemplate.selectList("orders.searchByName",ordersVo);
	}
	
}
