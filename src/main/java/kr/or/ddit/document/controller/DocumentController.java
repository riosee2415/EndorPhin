package kr.or.ddit.document.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.service.IDocumentService;
import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;

@Controller
public class DocumentController {
	private Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@Resource(name="documentService")
	private IDocumentService documentService;
	
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
	public String insertDocument(DocumentVo documentVo,String presentDepartment,String documentNumber, String presentUser,
								String presentDate,String title,String contents,String preservation ) throws ParseException{
		
		Date date = new Date();									
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		date= sdf.parse(presentDate);
			
		logger.debug("presentDepartment:{}",presentDepartment);
		logger.debug("documentNumber:{}",documentNumber);
		logger.debug("presentUser:{}",presentUser);
		logger.debug("presentDate:{}",presentDate);
		logger.debug("title:{}",title);
		logger.debug("contents:{}",contents);
		logger.debug("preservation:{}",preservation);
		documentVo.setPresentDepartment(presentDepartment);
		documentVo.setDocumentNumber(documentNumber);
		documentVo.setPresentUser(presentUser);
		documentVo.setPresentDate(date);
		documentVo.setTitle(title);
		documentVo.setContents("sdfsd");
		documentVo.setPreservation(preservation);
		
		int insert = documentService.insertDocument(documentVo);
		return "document";
	}
}
