package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.PageVo;

public interface IBoard_detailDao {

	/**
	 * 
	* Method : postAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 전체 조회
	 */
	List<Board_detailVo> postAllList();
	
	/**
	 * 
	* Method : postSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 특정 게시글 조회
	 */
	Board_detailVo postSelectOne(String boardNo);
	
	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 수 조회
	 */
	int postCnt(String boardTypeCode);
	
	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	int postInsert(Board_detailVo board_detailVo);
	
	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	int postUpdate(Board_detailVo board_detailVo);
	
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
	* Method : selectAllPosts
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 페이지 조회
	 */ 
	List<Board_detailVo> selectPagePost(PageVo pageVo);

	
}
