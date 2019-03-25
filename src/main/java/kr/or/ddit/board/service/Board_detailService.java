package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.IBoard_detailDao;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.PageVo;

@Service("board_detailService")
public class Board_detailService implements IBoard_detailService{

	@Resource(name="board_detailDao")
	private IBoard_detailDao board_detailDao;

	/**
	 * 
	* Method : postAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 전체 출력
	 */
	@Override
	public List<Board_detailVo> postAllList() {
		List<Board_detailVo> postAllList = board_detailDao.postAllList();
		return postAllList;
	}

	/**
	 * 
	* Method : postSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 특정 게시글만 출력
	 */
	@Override
	public Board_detailVo postSelectOne(String boardNo) {
		Board_detailVo postSelectOne = board_detailDao.postSelectOne(boardNo);
		return postSelectOne;
	}

	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 수 조회
	 */
	@Override
	public  int postCnt(String boardTypeCode) {
		int postCnt = board_detailDao.postCnt(boardTypeCode);
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
		int postInsert = board_detailDao.postInsert(board_detailVo);
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
		int postUpdate = board_detailDao.postUpdate(board_detailVo);
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
		int postDelete = board_detailDao.postDelete(boardno);
		return postDelete;
	}

	/**
	 * 
	 * Method : selectPagePost
	 * 작성자 : macbook
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 게시글 페이지 조회
	 */
	@Override
	public Map<String, Object> selectPagePost(PageVo pageVo) {
		List<Board_detailVo> postsList = board_detailDao.selectPagePost(pageVo);
		int postsCnt = board_detailDao.postCnt(pageVo.getBoardTypeCode());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("postsList", postsList);
		resultMap.put("postsCnt", postsCnt);
		
		return resultMap;
	}

}
