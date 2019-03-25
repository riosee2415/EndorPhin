package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.model.Payment_detailVo;

public interface IPayment_DetailService {
	int insertPayment_detail(Payment_detailVo payment_detailVo);
	List<Payment_detailVo> getAllPayment_detail();
	Payment_detailVo selectPayment_detail(String payDetailCode);
	int deletePayment_detail(String payDetailCode);
	List<Payment_detailVo> selectPayment_detailStatus(String useStatus);
}
