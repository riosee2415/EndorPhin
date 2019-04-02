package kr.or.ddit.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IDe_Product_divDao;
import kr.or.ddit.payment.dao.IPaymentDao;
import kr.or.ddit.payment.dao.IPayment_DetailDao;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_detailVo;

@Service("paymentService")
public class PaymentService implements IPaymentService{

	private Logger logger = LoggerFactory.getLogger(PaymentService.class);
	
	@Resource(name="paymentDao")
	IPaymentDao paymentDao;
	
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	
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
	public boolean updateAndInsertPayment(Payment4UpdVo payment4UpdVo) {
		String searchPaymentDupl = paymentDao.searchPaymentDupl(payment4UpdVo.getPayday());
		if(searchPaymentDupl==null){
			paymentDao.insertPayment(new PaymentVo( payment4UpdVo.getUserid(),payment4UpdVo.getPayday()));
			String maxPayment = paymentDao.getMaxPayment();
			if(payment4UpdVo.getDecdPayList().isEmpty()){
				return true;
			}
			for (int i = 0; i < payment4UpdVo.getDecdPayList().size(); i++) {
				payment_detailDao.insertPayment_detail(new Payment_detailVo(
						payment4UpdVo.getDecdMap().get(i), maxPayment, payment4UpdVo.getDecdPayList().get(i)));
			}
			PaymentVo paymentVo = new PaymentVo();
			paymentVo.setPayCode(maxPayment);
			paymentVo.setPayDay(payment4UpdVo.getPayday());
			paymentDao.updatePayment(paymentVo);
			return true;
		}
		return false;
	}

	@Override
	public void updatePaymentDetailAjax(Payment4UpdVo payment4UpdVo) {
		payment_detailDao.deletePayment_detail(new Payment_detailVo(null,payment4UpdVo.getPayCode(),null,payment4UpdVo.getDeprostatus()));
		if(!(payment4UpdVo.getDecdPayList().isEmpty())){
			for (int i = 0; i < payment4UpdVo.getDecdPayList().size(); i++) {
				Payment_detailVo payment_detailVo = new Payment_detailVo(payment4UpdVo.getDecdMap().get(i),payment4UpdVo.getPayCode());
				payment_detailVo.setDeductPay(payment4UpdVo.getDecdPayList().get(i));
				payment_detailDao.insertPayment_detail(payment_detailVo);
			}
		}
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setPayCode(payment4UpdVo.getPayCode());
		paymentVo.setPayDay(payment4UpdVo.getPayday());
		paymentDao.updatePayment(paymentVo);
	}
	
	
}
