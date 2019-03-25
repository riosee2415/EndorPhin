package kr.or.ddit.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IPayment_DetailDao;
import kr.or.ddit.payment.model.Payment_detailVo;

@Service("payment_detailService")
public class Payment_DetailService implements IPayment_DetailService{
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;

	@Override
	public int insertPayment_detail(Payment_detailVo payment_detailVo) {
		return payment_detailDao.insertPayment_detail(payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> getAllPayment_detail() {
		return payment_detailDao.getAllPayment_detail();
	}

	@Override
	public Payment_detailVo selectPayment_detail(String payDetailCode) {
		return payment_detailDao.selectPayment_detail(payDetailCode);
	}

	@Override
	public int deletePayment_detail(String payDetailCode) {
		return payment_detailDao.deletePayment_detail(payDetailCode);
	}

	@Override
	public List<Payment_detailVo> selectPayment_detailStatus(String useStatus) {
		return payment_detailDao.selectPayment_detailStatus(useStatus);
	}
	

}
