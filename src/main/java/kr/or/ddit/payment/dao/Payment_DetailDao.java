package kr.or.ddit.payment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.Payment_detailVo;

@Repository("payment_detailDao")
public class Payment_DetailDao implements IPayment_DetailDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertPayment_detail(Payment_detailVo payment_detailVo) {
		return sqlSessionTemplate.insert("payment_detail.insertPayment_detail",payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> getAllPayment_detail() {
		return sqlSessionTemplate.selectList("payment_detail.getAllPayment_detail");
	}

	@Override
	public Payment_detailVo selectPayment_detail(String payDetailCode) {
		return sqlSessionTemplate.selectOne("payment_detail.selectPayment_detail",payDetailCode);
	}

	@Override
	public int deletePayment_detail(String payDetailCode) {
		return sqlSessionTemplate.delete("payment_detail.deletePayment_detail",payDetailCode);
	}

	@Override
	public List<Payment_detailVo> selectPayment_detailStatus(String useStatus) {
		return sqlSessionTemplate.selectList("payment_detail.selectPayment_detailStatus",useStatus);
	}

	
}