package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.util.model.PageVo;

public interface IBoard_detailService {

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	Map<String, Object>postDetail(String boardNo);
	
	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	int postInsert(Board_detailVo board_detailVo, List<Attach_boardVo> attachList);
	
	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	int postUpdate(Board_detailVo board_detailVo, List<Attach_boardVo> attachList);
	
	/**
	 * 
	* Method : postDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 게시글 삭제
	 */
	int postDelete(String boardno);
	
	/**
	 * 
	* Method : selectPostList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 목록 조회
	 */ 
	Map<String, Object> selectPostList(PageVo pageVo);
	
	/**
	 * 
	* Method : select_latelyPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 작성한 게시글의 최신글번호 조회
	 */
	Board_detailVo select_latelyPost(String boardTypeCode);
	
}
