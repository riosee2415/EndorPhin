package kr.or.ddit.document.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.document.dao.IDocument_refDao;
import kr.or.ddit.document.model.Document_refVo;


@Service
public class Document_refService implements IDocument_refService{

	@Resource(name="document_refDao")
	private IDocument_refDao document_refDao;
	

	@Override
	public int insertDocument_ref(Document_refVo document_refVo) {
		return document_refDao.insertDocument_ref(document_refVo);
	}

	@Override
	public List<Document_refVo> getAllDocument_ref() {
		return document_refDao.getAllDocument_ref();
	}

	@Override
	public List<Document_refVo> selectDocument_ref(String documentNumber) {
		return document_refDao.selectDocument_ref(documentNumber);
	}

	@Override
	public int updateDocument_ref(String documentNumber) {
		return document_refDao.updateDocument_ref(documentNumber);
	}

}
