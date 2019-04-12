package kr.or.ddit.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.util.model.PageVo;

@Repository("board_detailDao")
public class Board_detailDao implements IBoard_detailDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

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
	public Board_detailVo postDetail(String boardNo) {
		Board_detailVo Board_detailVo = sqlSession.selectOne("board_detail.postDetail", boardNo);
		return Board_detailVo;
	}

	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시판 별 게시글 수 조회
	 */
	@Override
	public int postCnt(String boardTypeCode) {
		int postCnt = sqlSession.selectOne("board_detail.postCnt", boardTypeCode);
		return postCnt;
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
	public int postInsert(Board_detailVo board_detailVo) {
		int postInsert = sqlSession.insert("board_detail.postInsert", board_detailVo);
		return postInsert;
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
	public int postUpdate(Board_detailVo board_detailVo) {
		int postUpdate = sqlSession.update("board_detail.postUpdate", board_detailVo);
		return postUpdate;
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
		int postDelete = sqlSession.update("board_detail.postDelete", boardno);
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
	public List<Board_detailVo> selectPostList(PageVo pageVo) {
		List<Board_detailVo> selectPostList = sqlSession.selectList("board_detail.selectPostList", pageVo);
		return selectPostList;
	}

	/**
	 * 
	* Method : select_boardPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 최신 게시글 조회
	 */
	@Override
	public Board_detailVo select_boardPost(String boardTypeCode) {
		Board_detailVo select_boardPost = sqlSession.selectOne("board_detail.selectPostList", boardTypeCode);
		return select_boardPost;
	}

	//====================테스트======================
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	@Override
	public List<Board_detailVo> selectBoardList(PageVo param) {
		List<Board_detailVo> selectList = sqlSession.selectList("board_detail.selectBoardList", param);
		 return selectList;

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
	public int insertBoard(Board_detailVo param) {
        int insertBoard = sqlSession.insert("board_detail.insertBoard", param);
        return insertBoard;
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
		Board_detailVo selectBoardOne = sqlSession.selectOne("board_detail.selectBoardOne", boardNo);
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
	public int updateBoard(Board_detailVo param) {
		int updateBoard = sqlSession.update("board_detail.updateBoard", param);
		return updateBoard;
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
		int deleteBoardOne = sqlSession.delete("board_detail.deleteBoardOne", boardNo);
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
		Integer selectBoardCount = sqlSession.selectOne("board_detail.selectBoardCount", boardTypeCode);
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
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("title", title);
		
		return sqlSession.selectList("board_detail.selectBoardTitle",map);
	}
	
	@Override
	public List<Board_detailVo> selectBoardUserId(String startDate, String endDate, String userId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("userId", userId);
		
		return sqlSession.selectList("board_detail.selectBoardUserId",map);
	}

	@Override
	public List<Board_detailVo> selectBoardcontens(String startDate, String endDate, String contents) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("contents", contents);
		
		return sqlSession.selectList("board_detail.selectBoardContents",map);
	}

	@Override
	public List<Board_detailVo> listAll(String searchType, String keyword, String startDate, String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		return sqlSession.selectList("board_detail.listAll",map);
	}
	
	@Override
	public int countAricle(String searchType, String keyword, String startDate, String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectOne("board_detail.countAricle",map);
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
		sqlSession.insert("comments.insertBoardReply", param);
		
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
		sqlSession.update("comments.updateBoardReply", param);
		
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
		return sqlSession.selectList("comments.selectBoardReplyList", param);
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
	public int deleteBoardReply(String boardNo) {
		
		return sqlSession.delete("comments.deleteBoardReply", boardNo);
	}
	
}
