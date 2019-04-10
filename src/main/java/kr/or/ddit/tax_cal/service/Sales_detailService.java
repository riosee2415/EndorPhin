package kr.or.ddit.tax_cal.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.ISales_detailDao;
import kr.or.ddit.tax_cal.model.Sales_detailVo;

@Service("sales_detailService")
public class Sales_detailService implements ISales_detailService{

	
	@Resource(name="sales_detailDao")
	private ISales_detailDao sales_detailDao;

	@Override
	public int insertSales_detail(Sales_detailVo sales_detailVo) {
		return sales_detailDao.insertSales_detail(sales_detailVo);
	}
	
	
}