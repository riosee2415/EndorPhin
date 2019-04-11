package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.slip.model.SlipVo;
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

	//===================테스트==========================
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	List<Board_detailVo> selectBoardList(PageVo param);
	
	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 등록 & 게시글 수정
	 */
	int insertBoard(Board_detailVo param);
	
	/**
	 * 
	* Method : selectBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세조회
	 */
	Board_detailVo selectBoardOne(String boardNo); 
	
	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	 */
	int updateBoard(Board_detailVo param);
	
	/**
	 * 
	* Method : deleteBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 삭제
	 */
	int deleteBoardOne(String boardNo);
	
	/**
	 * 
	* Method : selectBoardCount
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 게시글 전체 갯수
	 */
	Integer selectBoardCount(String boardTypeCode);
	
	/**
	 * 
	* Method : getBetweenSlip
	* 작성자 : macbook
	* 변경이력 :
	* @param pre_date
	* @param post_date
	* @return
	* Method 설명 : 검색
	 */
	public List<Board_detailVo> selectBoardTitle(String startDate, String endDate, String title);
	public List<Board_detailVo> selectBoardUserId(String startDate, String endDate, String userId);
	public List<Board_detailVo> selectBoardcontens(String startDate, String endDate, String contents);
	
	public List<Board_detailVo> listAll(String searchType, String keyword, String startDate, String endDate);
	public int countAricle(String searchType, String keyword, String startDate, String endDate);
	
}
