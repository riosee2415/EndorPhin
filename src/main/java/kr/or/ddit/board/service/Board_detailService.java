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

	//====================테스트==========================
	
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
//	@Override
//	public List<Board_detailVo> selectBoardList(PageVo param) {
//		List<Board_detailVo> selectBoardList = board_detailDao.selectBoardList(param);
//		return selectBoardList;
//
//	}
	
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	@Override
	public Map<String, Object> selectBoardList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Board_detailVo> selectPostList = board_detailDao.selectPostList(pageVo);
		int postCnt = board_detailDao.postCnt(pageVo.getBoardTypeCode());
		resultMap.put("postList", selectPostList);
		resultMap.put("postCnt", postCnt);
		return resultMap;
	}
	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 등록
	 */
	@Override
	public int insertBoard(Board_detailVo param, List<Attach_boardVo> attachList) {
		int attachCnt= 0;
		int insertBoard = board_detailDao.insertBoard(param);
		for (Attach_boardVo attach : attachList) {
			attach_boardDao.attachInsert(attach);
			attachCnt++;
		}
		return insertBoard + attachCnt;
	}

	/**
	 * 
	* Method : selectBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세조회
	 */
	@Override
	public Board_detailVo selectBoardOne(String boardNo) {
		Board_detailVo selectBoardOne = board_detailDao.selectBoardOne(boardNo);
		return selectBoardOne;
	}

	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	 */
	@Override
	public int updateBoard(Board_detailVo param, List<Attach_boardVo> attachList) {
		int attachCnt = 0;
		int updateBoard = board_detailDao.updateBoard(param);
		for (Attach_boardVo attach : attachList) {
			attach_boardDao.attachUpdate(attach);
			attachCnt++;
		}
		return updateBoard + attachCnt;
	}

	/**
	 * 
	* Method : deleteBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 삭제
	 */
	@Override
	public int deleteBoardOne(String boardNo) {
		int deleteBoardOne = board_detailDao.deleteBoardOne(boardNo);
		return deleteBoardOne;
	}

	/**
	 * 
	* Method : selectBoardCount
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 게시글 전체 갯수
	 */
	@Override
	public Integer selectBoardCount(String boardTypeCode) {
		Integer selectBoardCount = board_detailDao.selectBoardCount(boardTypeCode);
		return selectBoardCount;
	}

	/**
	 * 
	* Method : selectBoardTitle
	* 작성자 : macbook
	* 변경이력 :
	* @param startDate
	* @param endDate
	* @param title
	* @return
	* Method 설명 : 검색
	 */
	@Override
	public List<Board_detailVo> selectBoardTitle(String startDate, String endDate, String title) {
		return board_detailDao.selectBoardTitle(startDate, endDate, title);
	}

	@Override
	public List<Board_detailVo> selectBoardUserId(String startDate, String endDate, String userId) {
		return board_detailDao.selectBoardUserId(startDate, endDate, userId);
	}

	@Override
	public List<Board_detailVo> selectBoardcontens(String startDate, String endDate, String contents) {
		return board_detailDao.selectBoardcontens(startDate, endDate, contents);
	}

	/**
	 * 
	* Method : listAll
	* 작성자 : macbook
	* 변경이력 :
	* @param searchType
	* @param keyword
	* @return
	* Method 설명 : 게시글 전체 목록 검색
	 */
	@Override
	public List<Board_detailVo> listAll(String searchType, String keyword, String startDate, String endDate) {
		return board_detailDao.listAll(searchType, keyword, startDate, endDate);
	}

	@Override
	public int countAricle(String searchType, String keyword, String startDate, String endDate) {
		return board_detailDao.countAricle(searchType, keyword, startDate, endDate);
	}

	/**
	 * 
	* Method : updateBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 수정
	 */
	@Override
	public void updateBoardReply(CommentsVo param) {
		board_detailDao.updateBoardReply(param);
		
	}

	/**
	 * 
	* Method : insertBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 등록
	 */
	@Override
	public void insertBoardReply(CommentsVo param) {
		board_detailDao.insertBoardReply(param);
		
	}

	/**
	 * 
	* Method : selectBoardReplyList
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 리스트 조회
	 */
	@Override
	public List<CommentsVo> selectBoardReplyList(String param) {
		
		return board_detailDao.selectBoardReplyList(param);
	}

	/**
	 * 
	* Method : deleteCommnetOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	@Override
	public int deleteBoardReply(String commentNo) {
		return board_detailDao.deleteBoardReply(commentNo);
	}

	/**
	 * 
	* Method : selectBoardFileList
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 첨부파일 리스트 조회
	 */
	@Override
	public List<Attach_boardVo> selectBoardFileList(String boardNo) {
		return board_detailDao.selectBoardFileList(boardNo);
	}

}
