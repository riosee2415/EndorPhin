package kr.or.ddit.payment.dao;

import java.util.List;

import kr.or.ddit.payment.model.De_product_divVo;

public interface IDe_Product_divDao {
	List<De_product_divVo> getAllDe_product_div();
	De_product_divVo selectDe_product_div(String deductCode);
}
