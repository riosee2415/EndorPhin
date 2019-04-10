package kr.or.ddit.product.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.service.IProductService;

@RequestMapping(path="/product")
@Controller
public class ProductController {
	
	@Resource(name="productService")
	IProductService productService;
	
	@RequestMapping(path="/productInput")
	public String productInput(Model model){
		model.addAttribute("allProductList",productService.getAllProduct());
		return "prodInput";
	}
	
	@RequestMapping(path = "/findProductCode", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public ProductVo findDeductCode_post(Model model, String productCode) {
		ProductVo selectProduct = productService.selectProduct(productCode);
		return selectProduct;
	}
}
