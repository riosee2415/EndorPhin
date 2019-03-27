package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.IAttach_boardDao;
import kr.or.ddit.board.dao.IBoard_detailDao;
import kr.or.ddit.board.dao.ICommentsDao;
import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.util.model.PageVo;

@Service("board_detailService")
public class Board_detailService implements IBoard_detailService{

	@Resource(name="board_detailDao")
	private IBoard_detailDao board_detailDao;
	
	@Resource(name="attach_boardDao")
	private IAttach_boardDao attach_boardDao;
	
	@Resource(name="commentsDao")
	private ICommentsDao commentsDao;

	public Board_detailService(){
		
	}

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	@Override
	public Map<String, Object> postDetail(String boardNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Board_detailVo postDetail = board_detailDao.postDetail(boardNo);
		List<Attach_boardVo> attachBoardNoSelect = attach_boardDao.attachBoardNoSelect(boardNo);
		List<CommentsVo> selectComments_boardNo = commentsDao.selectComments_boardNo(boardNo);
		resultMap.put("post", postDetail);
		resultMap.put("attachList", attachBoardNoSelect);
		resultMap.put("commentList", selectComments_boardNo);
		return resultMap;
	}


	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	@Override
	public int postInsert(Board_detailVo board_detailVo, List<Attach_boardVo> attachList) {
		int attachCnt = 0;
		
		int postInsert = board_detailDao.postInsert(board_detailVo);
		for (Attach_boardVo attach : attachList) {
			attach_boardDao.attachInsert(attach);
			attachCnt++;
		}
		return attachCnt + postInsert;
	}

	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	@Override
	public int postUpdate(Board_detailVo board_detailVo, List<Attach_boardVo> attachList) {
		int attachCnt = 0;
		
		int postUpdate = board_detailDao.postUpdate(board_detailVo);
		for (Attach_boardVo attach : attachList) {
			attach_boardDao.attachUpdate(attach);
			attachCnt++;
		}
		return attachCnt + postUpdate;
	}

	/**
	 * 
	* Method : postDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 게시글 삭제
	 */
	@Override
	public int postDelete(String boardno) {
		int postDelete = board_detailDao.postDelete(boardno);
		return postDelete;
	}

	/**
	 * 
	* Method : selectPostList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 목록 조회
	 */ 
	@Override
	public Map<String, Object> selectPostList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Board_detailVo> selectPostList = board_detailDao.selectPostList(pageVo);
		int postCnt = board_detailDao.postCnt(pageVo.getBoardTypeCode());
		resultMap.put("postList", selectPostList);
		resultMap.put("postCnt", postCnt);
		return resultMap;
	}

	/**
	 * 
	* Method : select_latelyPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 작성한 게시글의 최신글번호 조회
	 */
	@Override
	public Board_detailVo select_latelyPost(String boardTypeCode) {
		Board_detailVo select_boardPost = board_detailDao.select_boardPost(boardTypeCode);
		return select_boardPost;
	}

}
