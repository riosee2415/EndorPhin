package kr.or.ddit.document.service;

import static org.junit.Assert.assertTrue;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;
import kr.or.ddit.set.LogicConfig;

public class DocumentServiceTest extends LogicConfig{

	@Resource(name="documentService")
	IDocumentService documentService;

	@Resource(name="document_refService")
	IDocument_refService document_refService;
	
	@Test
	public void insertCompanyTest() {
		
		Date date = new Date();									
			
		DocumentVo documentVo = new DocumentVo();
		documentVo.setDocumentNumber("45454545");
		documentVo.setTitle("1");
		documentVo.setPreservation("11");
		documentVo.setPresentDate(date);
		documentVo.setContents("1111");
		documentVo.setPresentDepartment("100");
		documentVo.setPresentUser("11");
		
		int insertCompany = documentService.insertDocument(documentVo);
		assertTrue(insertCompany==1);
	}

	@Test
	public void insertDocument_RefTest() {
		
		Document_refVo document_refVo = new Document_refVo();
		document_refVo.setReferenceNumber("");
		document_refVo.setDocumentNumber("123");
		document_refVo.setSortation("0");
		document_refVo.setUserId("11");
	
		int insertDocument_ref = document_refService.insertDocument_ref(document_refVo);
		assertTrue(insertDocument_ref==1);
	}
}
