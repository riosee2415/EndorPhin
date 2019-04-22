package kr.or.ddit.document.service;

import static org.junit.Assert.assertTrue;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.set.LogicConfig;

public class DocumentServiceTest extends LogicConfig{

	@Resource(name="documentService")
	IDocumentService documentService;

	@Test
	public void insertCompanyTest() {
		
		Date date = new Date();									
			
		DocumentVo documentVo = new DocumentVo();
		documentVo.setPresentDepartment("100");
		documentVo.setDocumentNumber("8");
		documentVo.setPresentUser("11");
		documentVo.setTitle("1");
		documentVo.setContents("1111");
		documentVo.setPreservation("11");
		documentVo.setPresentDate(date);
		
		int insertCompany = documentService.insertDocument(documentVo);
		assertTrue(insertCompany==1);
	}

}
