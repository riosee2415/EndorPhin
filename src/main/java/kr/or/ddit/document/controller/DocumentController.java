package kr.or.ddit.document.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;

@Controller
public class DocumentController {
	private Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@Resource(name="employeeDao")
	private IEmployeeDao dao;
	
	@RequestMapping("/document")
	public String document(Model model, HttpSession session,DocumentVo documentVo){
		
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		String userName = employeeVo.getUserNm().toString();
		String deptName = employeeVo.getDeptname().toString();
		
		model.addAttribute("userName",userName);
		model.addAttribute("deptName",deptName);
		return "document";
	}
	@RequestMapping("/insertDocument")
	public String insertDocument(String documentNumber, String presentUser,String presentDate,String title,String contents){

		return "document";
	}
}
