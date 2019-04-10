package kr.or.ddit.product.dao;

import java.util.List;

import kr.or.ddit.product.model.ProductVo;

public interface IProductDao {
	int insertProduct(ProductVo productVo);
	List<ProductVo> getAllProduct();
	ProductVo selectProduct(String productCode);
	int deleteProduct(String productCode);
}
