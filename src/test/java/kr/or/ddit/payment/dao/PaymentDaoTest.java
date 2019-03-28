package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.set.LogicConfig;

public class PaymentDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(PaymentDaoTest.class);
	
	@Resource(name="paymentDao")
	IPaymentDao paymentDao;
	
	@Test
	public void insertPaymentTest() {
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setPayCode("2");
		paymentVo.setUserId("1");
		int insertPayment = paymentDao.insertPayment(paymentVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void getAllPaymentTest() {
		List<PaymentVo> allPayment = paymentDao.getAllPayment();
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListTest() {
		List<PaymentVo> allPayment = paymentDao.getPaymentList();
		for (PaymentVo paymentVo : allPayment) {
			logger.debug("payment111:{}",paymentVo);
		}
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListByUserNmTest() {
		List<PaymentVo> allPayment = paymentDao.getPaymentListByUserNm("호");
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPayment_uTest() {
		List<PaymentVo> payment_u = paymentDao.getPayment_u("1");
		assertTrue(payment_u.size()>0);
	}
	@Test
	public void selectPaymentTest() {
		PaymentVo selectPayment = paymentDao.selectPayment("1");
		assertNotNull(selectPayment);
	}
	@Test
	public void deletePaymentTest() {
		int deletePayment = paymentDao.deletePayment("2");
		assertEquals(1, deletePayment);
	}

}
