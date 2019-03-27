package kr.or.ddit.payment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.Payment_reportVo;

@Repository("paymentreportDao")
public class Payment_reportDao implements IPayment_reportDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertPayment_report(Payment_reportVo payment_reportVo) {
		return sqlSessionTemplate.insert("payment_report.insertPayment_report",payment_reportVo);
	}

	@Override
	public int deletePayment_report(String paymentreportcode) {
		return sqlSessionTemplate.delete("payment_report.deletePayment_report",paymentreportcode);
	}

	@Override
	public List<Payment_reportVo> getAllPayment_report() {
		return sqlSessionTemplate.selectList("payment_report.getAllPayment_report");
	}

	@Override
	public Payment_reportVo selectPayment_report(String paymentreportcode) {
		return sqlSessionTemplate.selectOne("payment_report.selectPayment_report",paymentreportcode);
	}
	
	
}
