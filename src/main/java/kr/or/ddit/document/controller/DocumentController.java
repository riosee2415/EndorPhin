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
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;
import kr.or.ddit.document.service.IDocumentService;
import kr.or.ddit.document.service.IDocument_refService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
//테스트
@Controller
public class DocumentController {
	private Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@Resource(name="document_refService")
	private IDocument_refService document_refService;
	
	@Resource(name="documentService")
	private IDocumentService documentService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	@RequestMapping("/document")
	public String document(Model model, HttpSession session,DocumentVo documentVo){
		
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		String userName 	= employeeVo.getUserNm().toString();
		String deptName 	= employeeVo.getDeptname().toString();
		String positionCode = employeeVo.getPositionCode().toString();
		
		List<DocumentVo> documentList = documentService.getAllDocument();
		List<EmployeeVo> employeeList = employeeService.selectMoreEmployee(positionCode);
		
		model.addAttribute("employeeList",employeeList);
		
		model.addAttribute("documentList",documentList);
		model.addAttribute("userName",userName);
		model.addAttribute("deptName",deptName);
		model.addAttribute("positionCode",positionCode);
		
		return "document";
	}
	
	@RequestMapping("/insertDocument_ref")
	public String insertDocument_ref(Document_refVo document_refVo,@RequestParam("checkRow") String checkRow,
																	@RequestParam("frm_documentNumber") String documentNumber) {
		
		
		logger.debug("documentNumber:{}",documentNumber);
		String[] arrIdx = checkRow.toString().split(",");
		
		
        for (int i=0; i< arrIdx.length; i++) {
        	String arr = (arrIdx[i]);
        	document_refVo.setUserId(arr);
        	document_refVo.setDocumentNumber(documentNumber);
        	document_refVo.setReferenceNumber(documentNumber);
        	document_refVo.setSortation("0");
        	document_refService.insertDocument_ref(document_refVo);
            logger.debug("arr:{}",arr);
        }
        logger.debug("arr:{}",checkRow);
		return "document";
	}

	@RequestMapping("/insertDocument")
	public String insertDocument(DocumentVo documentVo,String presentDepartment,String documentNumber, String presentUser,
								String presentDate,String title,String contents,String preservation, String documentType, 
								HttpSession session) throws ParseException{
	
    
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
