package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.util.model.PageVo;

public interface IBoard_detailDao {

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	Board_detailVo postDetail(String boardNo);
	
	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시판 별 게시글 수 조회
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
	* Method : selectPostList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 목록 조회
	 */ 
	List<Board_detailVo> selectPostList(PageVo pageVo);
	
	/**
	 * 
	* Method : select_boardPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 최신 게시글 조회
	 */
	Board_detailVo select_boardPost(String boardTypeCode);

	
}
