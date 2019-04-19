package kr.or.ddit.document.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.service.IDocumentService;
import kr.or.ddit.employee.model.EmployeeVo;
//테스트
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
		
		List<DocumentVo> documentList = documentService.getAllDocument();
		
		model.addAttribute("documentList",documentList);
		model.addAttribute("userName",userName);
		model.addAttribute("deptName",deptName);
		
		return "document";
	}
	@RequestMapping("/insertDocument")
	public String insertDocument(DocumentVo documentVo,String presentDepartment,String documentNumber, String presentUser,
								String presentDate,String title,String contents,String preservation, String documentType, 
								HttpSession session)
										throws ParseException{
		
		
		logger.debug("documentType:{}",documentType);
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		String userId= employeeVo.getUserId().toString();
		
		Date date = new Date();									
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		date= sdf.parse(presentDate);
		
		documentVo.setPresentUser(userId);
		documentVo.setPresentDate(date);
		documentVo.setDocumentType(documentType);
		
		int insert = documentService.insertDocument(documentVo);
		
		if(insert > 0){
			return "document";
		}else{
			return "document";
		}
	}
}
