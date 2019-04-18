package kr.or.ddit.document.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.DocumentVo;

@Repository("documentDao")
public interface IDocumentDao {
	
	int insertDocument(DocumentVo documentVo);
}
