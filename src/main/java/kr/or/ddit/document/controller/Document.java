package kr.or.ddit.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Document {

	@RequestMapping("/document")
	public String document(){
		return "document";
	}
}
