package kr.or.ddit.payment.service;

import java.util.List;
import java.util.Map;

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
	boolean updateAndInsertPayment(Payment4UpdVo payment4UpdVo);
	void updatePaymentDetailAjax(Payment4UpdVo payment4UpdVo);
	List<PaymentVo> selectTotalSalaryByDay(String payDay);
	List<PaymentVo> selectPersonalPaymentList(Map<String, Object> payDay);
	String paycodeByIdnDay(PaymentVo paymentVo);
}
