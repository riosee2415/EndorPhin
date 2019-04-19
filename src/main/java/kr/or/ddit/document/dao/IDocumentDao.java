package kr.or.ddit.document.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.DocumentVo;

@Repository("documentDao")
public interface IDocumentDao {
	
	
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
	* Method 설명 : 기안문서 등록
	*/
	int insertDocument(DocumentVo documentVo);
}
