package kr.or.ddit.board.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Attach_boardVo;
@Repository("attach_boardDao")
public class Attach_boardDao implements IAttach_boardDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : attach_boardSelect
	* 작성자 : macbook
	* 변경이력 :
	* @param boarno
	* @return
	* Method 설명 : 첨부파일에 대한 게시글 조회
	 */
	@Override
	public Attach_boardVo attach_boardSelect(String boardno) {
		Attach_boardVo attach_boardSelect = sqlSession.selectOne("attach_board.attach_boardSelect",boardno);
		return attach_boardSelect;
	}

	/**
	 * 
	* Method : attach_boardSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachcode
	* @return
	* Method 설명 : 첨부파일 조회
	 */
	@Override
	public Attach_boardVo attach_boardSelectOne(String attachcode) {
		Attach_boardVo attach_boardSelectOne = sqlSession.selectOne("attach_board.attach_boardSelectOne", attachcode);
		return attach_boardSelectOne;
	}

	/**
	 * 
	* Method : attach_boardInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param attach_boardVo
	* @return
	* Method 설명 : 첨부파일 등록
	 */
	@Override
	public int attach_boardInsert(Attach_boardVo attach_boardVo) {
		int attach_boardInsert = sqlSession.insert("attach_board.attach_boardInsert", attach_boardVo);
		return attach_boardInsert;
	}

	/**
	 * 
	* Method : attach_boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 첨부파일 삭제
	 */
	@Override
	public int attach_boardDelete(String boardno) {
		int attach_boardDelete = sqlSession.delete("attach_board.attach_boardDelete",boardno);
		return attach_boardDelete;
	}

	@Override
	public int attach_boardDeleteOne(String attachCode) {
		int attach_boardDeleteOne = sqlSession.delete("attach_board.attach_boardDeleteOne",attachCode);
		return attach_boardDeleteOne;
	}

}
