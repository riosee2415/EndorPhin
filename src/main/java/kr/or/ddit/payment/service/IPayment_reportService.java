package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.model.Payment_reportVo;

public interface IPayment_reportService {
	int insertPayment_report(Payment_reportVo payment_reportVo);
	int deletePayment_report(String paymentreportcode);
	List<Payment_reportVo> getAllPayment_report();
	Payment_reportVo selectPayment_report(String paymentreportcode);
}
