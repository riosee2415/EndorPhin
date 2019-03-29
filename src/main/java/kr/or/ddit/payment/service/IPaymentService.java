package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.model.PaymentVo;

public interface IPaymentService {
	int insertPayment(PaymentVo paymentVo);
	List<PaymentVo> getAllPayment();
	List<PaymentVo> getPayment_u(String userId);
	PaymentVo selectPayment(String paycode);
	int deletePayment(String paycode);
	List<PaymentVo> getPaymentList();
	List<PaymentVo> getPaymentListByUserNm(String usernm);
	void updateAndInsertPayment(Payment4UpdVo payment4UpdVo);
}
