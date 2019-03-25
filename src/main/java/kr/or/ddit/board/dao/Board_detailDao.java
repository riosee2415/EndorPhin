package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.jdbc.SQL;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.PageVo;

@Repository("board_detailDao")
public class Board_detailDao implements IBoard_detailDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : postAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 전체 조회
	 */
	@Override
	public List<Board_detailVo> postAllList() {
		List<Board_detailVo> postAllList = sqlSession.selectList("board_detail.postAllList");
		return postAllList;
	}

	/**
	 * 
	* Method : postSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 특정 게시글 조회
	 */
	@Override
	public Board_detailVo postSelectOne(String boardNo) {
		Board_detailVo postSelect = sqlSession.selectOne("board_detail.postSelectOne", boardNo);
		return postSelect;
	}

	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 수 조회
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
		int postDelete = sqlSession.delete("board_detail.postDelete",boardno);
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
	public List<Board_detailVo> selectPagePost(PageVo pageVo) {
		List<Board_detailVo> selectList = sqlSession.selectList("board_detail.selectPostPaingList", pageVo);
		return selectList;
	}

	
	
}
