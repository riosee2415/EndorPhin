package kr.or.ddit.product.service;

import java.util.List;

import kr.or.ddit.product.model.ProductVo;

public interface IProductService {
	int insertProduct(ProductVo productVo);
	List<ProductVo> getAllProduct();
	ProductVo selectProduct(String productCode);
	int deleteProduct(String productCode);
}
