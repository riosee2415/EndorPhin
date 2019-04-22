package kr.or.ddit.document.dao;

import java.util.List;

import kr.or.ddit.document.model.Document_refVo;

public interface IDocument_refDao {

	public int insertDocument_ref(Document_refVo document_refVo);
	
	public List<Document_refVo> getAllDocument_ref(); 
	
	public List<Document_refVo> selectDocument_ref(String documentNumber);

	public int updateDocument_ref(String documentNumber);
	
}
