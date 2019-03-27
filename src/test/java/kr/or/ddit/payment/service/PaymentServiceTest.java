package kr.or.ddit.payment.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.set.LogicConfig;

public class PaymentServiceTest extends LogicConfig{

	@Resource(name="paymentService")
	IPaymentService paymentService;

	@Test
	public void insertPaymentTest() {
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setPayCode("2");
		paymentVo.setUserId("1");
		int insertPayment = paymentService.insertPayment(paymentVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void getAllPaymentTest() {
		List<PaymentVo> allPayment = paymentService.getAllPayment();
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void selectPaymentTest() {
		PaymentVo selectPayment = paymentService.selectPayment("1");
		assertNotNull(selectPayment);
	}
	@Test
	public void deletePaymentTest() {
		int deletePayment = paymentService.deletePayment("2");
		assertEquals(1, deletePayment);
	}
	@Test
	public void getPayment_uTest() {
		List<PaymentVo> payment_u = paymentService.getPayment_u("1");
		assertTrue(payment_u.size()>0);
	}
	@Test
	public void getPaymentListTest() {
		List<PaymentVo> allPayment = paymentService.getPaymentList();
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListByUserNmTest() {
		List<PaymentVo> allPayment = paymentService.getPaymentListByUserNm("호");
		assertTrue(allPayment.size()>0);
	}

}
