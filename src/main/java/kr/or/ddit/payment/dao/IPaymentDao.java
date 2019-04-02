package kr.or.ddit.payment.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.payment.model.PaymentVo;

public interface IPaymentDao {
	int insertPayment(PaymentVo paymentVo);
	int updatePayment(PaymentVo paymentVo);
	List<PaymentVo> getAllPayment();
	PaymentVo selectPayment(String paycode);
	int deletePayment(String paycode);
	List<PaymentVo> getPayment_u(String userId);
	List<PaymentVo> getPaymentList();
	List<PaymentVo> getPaymentListByUserNm(String usernm);
	String getMaxPayment();
	String searchPaymentDupl(PaymentVo paymentVo);
	List<PaymentVo> selectTotalSalaryByDay(String payDay);
	List<PaymentVo> selectPersonalPaymentList(Map<String, Object> payDay);
}
