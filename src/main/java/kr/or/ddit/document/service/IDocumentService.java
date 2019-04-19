package kr.or.ddit.document.service;

import java.util.List;

import kr.or.ddit.document.model.DocumentVo;

public interface IDocumentService {
	
	/**
	* Method : getAllDocument
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : 모든 기안문서 조회
	*/
	List<DocumentVo> getAllDocument();
	
	/**
	* Method : insertDocument
	* 작성자 : PC05
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 기안등록
	*/
	int insertDocument(DocumentVo documentVo);
}
