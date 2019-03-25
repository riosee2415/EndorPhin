package kr.or.ddit.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.IAttach_boardDao;
import kr.or.ddit.board.model.Attach_boardVo;

@Service("attach_boardService")
public class Attach_boardService implements IAttach_boardService{
	
	@Resource(name="attach_boardDao")
	private IAttach_boardDao attach_boardDao;

	/**
	 * 
	* Method : attach_boardSelect
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 첨부파일에 대한 게시글 조회
	 */
	@Override
	public Attach_boardVo attach_boardSelect(String boardno) {
		Attach_boardVo attach_boardSelect = attach_boardDao.attach_boardSelect(boardno);
		return attach_boardSelect;
	}

	/**
	 * 
	* Method : attach_boardSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachcode
	* @return
	* Method 설명 : 첨부파일 번호 조회
	 */
	@Override
	public Attach_boardVo attach_boardSelectOne(String attachcode) {
		Attach_boardVo attach_boardSelectOne = attach_boardDao.attach_boardSelectOne(attachcode);
		return attach_boardSelectOne;
	}

	/**
	 * 
	* Method : attach_boardInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param attach_boardVo
	* @return
	* Method 설명 : 첨부 파일 등록 
	 */
	@Override
	public int attach_boardInsert(Attach_boardVo attach_boardVo) {
		int attach_boardInsert = attach_boardDao.attach_boardInsert(attach_boardVo);
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
		int attach_boardDelete = attach_boardDao.attach_boardDelete(boardno);
		return attach_boardDelete;
	}

	/**
	 * 
	* Method : attach_boardDeleteOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachCode
	* @return
	* Method 설명 : 특정 첨부파일 삭제
	 */
	@Override
	public int attach_boardDeleteOne(String attachCode) {
		int attach_boardDeleteOne = attach_boardDao.attach_boardDeleteOne(attachCode);
		return attach_boardDeleteOne;
	}
}
