package kr.or.ddit.payment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.PaymentVo;

@Repository("paymentDao")
public class PaymentDao implements IPaymentDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertPayment(PaymentVo paymentVo) {
		return sqlSessionTemplate.insert("payment.insertPayment",paymentVo);
	}

	@Override
	public List<PaymentVo> getAllPayment() {
		List<PaymentVo> selectList = sqlSessionTemplate.selectList("payment.getAllPayment");
		return selectList;
	}

	@Override
	public PaymentVo selectPayment(String paycode) {
		return sqlSessionTemplate.selectOne("payment.selectPayment",paycode);
	}

	@Override
	public int deletePayment(String paycode) {
		return sqlSessionTemplate.delete("payment.deletePayment",paycode);
	}

	@Override
	public List<PaymentVo> getPayment_u(String userId) {
		return sqlSessionTemplate.selectList("payment.getPayment_u",userId);
	}

	@Override
	public List<PaymentVo> getPaymentList() {
		return sqlSessionTemplate.selectList("payment.getPaymentList");
	}

	@Override
	public List<PaymentVo> getPaymentListByUserNm(String usernm) {
		return sqlSessionTemplate.selectList("payment.getPaymentListByUserNm",usernm);
	}

	@Override
	public String getMaxPayment() {
		return sqlSessionTemplate.selectOne("payment.getMaxPayment");
	}

	@Override
	public int updatePayment(PaymentVo paymentVo) {
		return sqlSessionTemplate.update("payment.updatePayment",paymentVo);
	}

}
