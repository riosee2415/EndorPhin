package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Board_detailVo;
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
	
}
