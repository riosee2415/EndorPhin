package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.model.De_product_divVo;

public interface IDe_Product_divService {
	List<De_product_divVo> getAllDe_product_div();
	De_product_divVo selectDe_product_div(String deductCode);
	int insertDe_product_div(De_product_divVo de_product_divVo);
	int deleteDe_product_div(String deductCode);
	List<De_product_divVo> selectDeproductByNm(String deductName);
	int updateDe_product_div(De_product_divVo de_product_divVo);
}
