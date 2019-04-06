package kr.or.ddit.payment.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IDe_Product_divDao;
import kr.or.ddit.payment.dao.IPaymentDao;
import kr.or.ddit.payment.dao.IPayment_DetailDao;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_detailVo;

@Service("payment_detailService")
public class Payment_DetailService implements IPayment_DetailService{
	
	private Logger logger = LoggerFactory.getLogger(Payment_DetailService.class);
	
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	@Resource(name="paymentDao")
	IPaymentDao paymentDao;

	@Override
	public int insertPayment_detail(Payment_detailVo payment_detailVo) {
		return payment_detailDao.insertPayment_detail(payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> getAllPayment_detail() {
		return payment_detailDao.getAllPayment_detail();
	}

	@Override
	public Payment_detailVo selectPayment_detail(Payment_detailVo payment_detailVo) {
		return payment_detailDao.selectPayment_detail(payment_detailVo);
	}

	@Override
	public int deletePayment_detail(Payment_detailVo payment_detailVo) {
		return payment_detailDao.deletePayment_detail(payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> selectPayment_detailPaycode(String useStatus) {
		return payment_detailDao.selectPayment_detailPaycode(useStatus);
	}

	@Override
	public Map<String, Object> getDeNmPayList(String userid) {
		Map<String, Object> map = new HashMap<>();
		List<PaymentVo> payment_u = paymentDao.getPayment_u(userid);
		if(!payment_u.isEmpty()){
			map.put("paymentList", payment_u);
			Map<String,List<Payment_detailVo>> list = new HashMap<>();
			for (int i = 0; i < payment_u.size(); i++) {
				List<Payment_detailVo> selectPayment_detailPaycode = payment_detailDao.selectPayment_detailPaycode(payment_u.get(i).getPayCode());
				list.put(i+"",selectPayment_detailPaycode);
			}
			map.put("paymentDetailList", list);
		}
		List<De_product_divVo> allDe_product_div = de_product_divDao.getAllDe_product_div();
		map.put("divList", allDe_product_div);
		return map;
	}
	
	@Override
	public Map<String, Object> getPayDetail(String paycode) {
		PaymentVo selectPayment = paymentDao.selectPayment(paycode);
		Map<String, Object> map = new HashMap<>();
		
		map.put("paymentVo", selectPayment);
		
		List<Payment_detailVo> selectPayment_detailPaycode = payment_detailDao.selectPayment_detailPaycode(paycode);
		map.put("paymentDetailList", selectPayment_detailPaycode);
		
		
		List<De_product_divVo> allDe_product_div = de_product_divDao.getAllDe_product_div();
		map.put("divList", allDe_product_div);
		return map;
		
	}

	@Override
	public Map<String, Object> getPayDetailByYear(Map<String, Object> paymap) {
		Map<String, Object> map = new HashMap<>();
		map.put("divList", de_product_divDao.getAllDe_product_div());
		List<PaymentVo> selectYearPaymentListDetail = paymentDao.selectYearPaymentListDetail(paymap);
		map.put("payList", selectYearPaymentListDetail);
		List<List<Payment_detailVo>> list = new ArrayList<>();
		for (int i = 0; i < selectYearPaymentListDetail.size(); i++) {
			List<Payment_detailVo> selectPayment_detailPaycode = payment_detailDao.selectPayment_detailPaycode(selectYearPaymentListDetail.get(i).getPayCode());
			list.add(selectPayment_detailPaycode);
		}
		map.put("paymentDetailList", list);
		
		return map;
	}

	

}
