package kr.or.ddit.document.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.document.dao.IDocumentDao;
import kr.or.ddit.document.model.DocumentVo;

@Service("documentService")
public class DocumentService implements IDocumentService{

	@Resource(name="documentDao")
	private IDocumentDao documentDao;
	
	@Override
	public int insertDocument(DocumentVo documentVo) {
		return documentDao.insertDocument(documentVo);
	}

	@Override
	public List<DocumentVo> getAllDocument() {
		return documentDao.getAllDocument();
	}

	@Override
	public List<DocumentVo> selectDocument(String documentnumber) {
		return documentDao.selectDocument(documentnumber);
	}
	
}
