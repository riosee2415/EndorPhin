package kr.or.ddit.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IPaymentDao;
import kr.or.ddit.payment.dao.IPayment_DetailDao;
import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.model.PaymentVo;

@Service("paymentService")
public class PaymentService implements IPaymentService{

	@Resource(name="paymentDao")
	IPaymentDao paymentDao;
	
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	
	@Override
	public int insertPayment(PaymentVo paymentVo) {
		return paymentDao.insertPayment(paymentVo);
	}

	@Override
	public List<PaymentVo> getAllPayment() {
		return paymentDao.getAllPayment();
	}

	@Override
	public PaymentVo selectPayment(String paycode) {
		return paymentDao.selectPayment(paycode);
	}

	@Override
	public int deletePayment(String paycode) {
		return paymentDao.deletePayment(paycode);
	}

	@Override
	public List<PaymentVo> getPayment_u(String userId) {
		return paymentDao.getPayment_u(userId);
	}

	@Override
	public List<PaymentVo> getPaymentList() {
		return paymentDao.getPaymentList();
	}

	@Override
	public List<PaymentVo> getPaymentListByUserNm(String usernm) {
		return paymentDao.getPaymentListByUserNm(usernm);
	}

	@Override
	public void updateAndInsertPayment(Payment4UpdVo payment4UpdVo) {
		paymentDao.insertPayment(new PaymentVo( payment4UpdVo.getUserid(),payment4UpdVo.getPayday()));
	}
	
	
}
