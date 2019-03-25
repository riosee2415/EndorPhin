package kr.or.ddit.board.service;

import kr.or.ddit.board.model.Attach_boardVo;

public interface IAttach_boardService {

	/**
	 * 
	* Method : attach_boardSelect
	* 작성자 : macbook
	* 변경이력 :
	* @param boarno
	* @return
	* Method 설명 : 첨부파일에 대한 게시글 조회
	 */
	Attach_boardVo attach_boardSelect(String boardno);
	
	/**
	 * 
	* Method : attach_boardSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachcode
	* @return
	* Method 설명 : 첨부파일 조회
	 */
	Attach_boardVo attach_boardSelectOne(String attachcode);
	
	/**
	 * 
	* Method : attach_boardInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param attach_boardVo
	* @return
	* Method 설명 : 첨부파일 등록
	 */
	int attach_boardInsert(Attach_boardVo attach_boardVo);
	
	/**
	 * 
	* Method : attach_boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 첨부파일 삭제
	 */
	int attach_boardDelete(String boardno);
	
	/**
	 * 
	* Method : attach_boardDeleteOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachCode
	* @return
	* Method 설명 : 특정 첨부 파일 삭제
	 */
	int attach_boardDeleteOne(String attachCode);
}
