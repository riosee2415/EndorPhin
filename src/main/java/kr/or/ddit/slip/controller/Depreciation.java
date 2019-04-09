package kr.or.ddit.slip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Depreciation {

	@RequestMapping("useAsset")
	public String ListDepreciation() {

		return"useAsset";
	}
}
