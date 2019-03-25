package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.set.LogicConfig;

public class Payment_detailDaoTest extends LogicConfig{

	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	@Test
	public void insertPayment_detailTest() {
		Payment_detailVo payment_detailVo= new Payment_detailVo();
		payment_detailVo.setPayDetailCode("2");
		payment_detailVo.setDeductCode("1");
		payment_detailVo.setPayCode("1");
		payment_detailVo.setUseStatus("1");
		payment_detailVo.setDeductPay("2000000");
		int insertPayment_detail = payment_detailDao.insertPayment_detail(payment_detailVo);
		assertEquals(1, insertPayment_detail);
	}
	@Test
	public void getAllPayment_detailTest() {
		List<Payment_detailVo> allPayment_detail = payment_detailDao.getAllPayment_detail();
		assertTrue(allPayment_detail.size()>0);
	}
	@Test
	public void selectPayment_detailTest() {
		Payment_detailVo selectPayment_detail = payment_detailDao.selectPayment_detail("1");
		assertNotNull(selectPayment_detail);
	}
	@Test
	public void deletePayment_detailTest() {
		int deletePayment_detail = payment_detailDao.deletePayment_detail("2");
		assertEquals(1, deletePayment_detail);
	}
	@Test
	public void selectPayment_detailStatusTest() {
		List<Payment_detailVo> selectPayment_detailStatus = payment_detailDao.selectPayment_detailStatus("1");
		assertTrue(selectPayment_detailStatus.size()>0);
	}

}
