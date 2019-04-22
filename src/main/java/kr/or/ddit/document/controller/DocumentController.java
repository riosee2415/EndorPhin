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
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		List<Document_refVo> document_refList = document_refService.getAllDocument_ref();
		
		
		model.addAttribute("document_refList",document_refList);
		model.addAttribute("employeeList",employeeList);
		model.addAttribute("documentList",documentList);
		model.addAttribute("userName",userName);
		model.addAttribute("deptName",deptName);
		model.addAttribute("positionCode",positionCode);

		return "document";
	}
	
	@RequestMapping("/selectDocument")
	public String selectDocument(@RequestParam(name="documentNumber", defaultValue="empty")String documentNumber,
									Model model, HttpSession session ,Document_refVo document_refVo){
									
		
		List<Document_refVo> selectDocument = document_refService.selectDocument_ref(documentNumber);
		
		model.addAttribute("selectDocument",selectDocument);
		model.addAttribute("documentNumber",documentNumber);
		
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		String userId		  = employeeVo.getUserId().toString();
		
		for(int i = 0; i < selectDocument.size(); i++){
			if(userId.equals(selectDocument.get(i).getUserId())){
				
				String ref_userId = selectDocument.get(i).getUserId();
				String document = selectDocument.get(i).getDocumentNumber();
			/*	if(soratation.equals("0")) {
					document_refVo.setSortation("1");
					document_refService.updateDocument_ref(documentNumber);
					
					logger.debug("soratation:::::{}",selectDocument.get(i).getSortation());
				model.addAttribute("ref_userId",ref_userId);
				model.addAttribute("document",document);
				logger.debug("ref_userId:::::{}", ref_userId);
				logger.debug("document:::::{}", document);
				}*/
			model.addAttribute("ref_userId",ref_userId);
			model.addAttribute("document",document);
			}
		}
		return "document";
	}
	
	@RequestMapping("/insertDocument")
	public String insertDocument(DocumentVo documentVo,String presentDepartment,String documentNumber, String presentUser,
								String presentDate,String title,String contents,String preservation, String documentType, 
								HttpSession session,@RequestParam("checkRow") String checkRow) throws ParseException{
	
	
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
    	
    	String userId = employeeVo.getUserId().toString();
    	
    	Date date = new Date();									
    	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
    	date= sdf.parse(presentDate);
    	
    	documentVo.setDocumentNumber(documentNumber);
    	documentVo.setPresentUser(userId);
    	documentVo.setPresentDate(date);
    	documentVo.setDocumentType(documentType);
    	
    	int insert = documentService.insertDocument(documentVo);
		
		Document_refVo document_refVo = new Document_refVo();
		String[] arrIdx = checkRow.toString().split(",");
		
		String arr = "";
		int cntInsert = 0;
        for (int i=0; i < arrIdx.length; i++) {
        	arr = arrIdx[i];
        	document_refVo.setUserId(arr);
        	document_refVo.setDocumentNumber(documentNumber);
        	document_refVo.setReferenceNumber("");
        	document_refVo.setSortation("0");
        	cntInsert = document_refService.insertDocument_ref(document_refVo);
        }
        	
		if(cntInsert > 0){
			return "document";
		}else{
			return "document";
		}
	}
	
	@RequestMapping("/temporarily")
	public String temporarilyList(Model model){
		
		return "temporarily";
	}
	
}
