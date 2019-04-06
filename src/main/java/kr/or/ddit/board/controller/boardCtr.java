package kr.or.ddit.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;

@Controller
public class boardCtr {
	private static final Logger logger = LoggerFactory.getLogger(boardCtr.class);
	@Resource(name="board_detailService")
	private IBoard_detailService board_detailService;
	
	@Resource(name="commentsService")
	private ICommentsService commentsService;
	
	@Resource(name="attach_boardService")
	private IAttach_boardService attach_boardService;
	
	@Resource(name="board_TypeService")
	private IBoard_TypeService board_TypeService;
	
	/**
	 * 
	* Method : boardList
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @return
	* @throws Exception
	* Method 설명 : 게시글 리스트 조회
	 */
	@RequestMapping(value = "/boardList")
    public String boardList(Model model, PageVo param) throws Exception {
        List<Board_detailVo> listview = board_detailService.selectBoardList();
        
        model.addAttribute("listview", listview);
        model.addAttribute("boardTypeCode", param.getBoardTypeCode());
        return "board/boardListTest";
    }
	
	/**
	 * 
	* Method : boardForm
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* @throws Exception
	* Method 설명 : 게시글 상세조회
	 */
	@RequestMapping(value = "/boardForm")
	public String boardForm(Model model,String boardTypeCode) throws Exception {
		model.addAttribute("boardTypeCode", boardTypeCode);
	    return "board/boardFormTest";
	}
	
	/**
	 * 
	* Method : boardSave
	* 작성자 : macbook
	* 변경이력 :
	* @param boardInfo
	* @return
	* @throws Exception
	* Method 설명 : 게시글 등록
	 */
	@RequestMapping(value = "/boardSave")
	public String boardSave(@ModelAttribute Board_detailVo boardInfo, HttpServletRequest request, String boardTypeCode, Model model) throws Exception {
//		HttpSession session = request.getSession();
//		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
//		boardInfo.setUserId(employeeVo.getUserId());
		model.addAttribute("boardTypeCode", boardTypeCode);
		board_detailService.insertBoard(boardInfo);
	    return "redirect:/boardList";
	}
	
	/**
	 * 
	* Method : boardRead
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardNo
	* @param model
	* @param boardTypeCode
	* @return
	* @throws Exception
	* Method 설명 : 게시글 상세 화면
	 */
	@RequestMapping(value = "/boardRead")
	public String boardRead(HttpServletRequest request, String boardNo, Model model, String boardTypeCode) throws Exception {
        
        Board_detailVo boardInfo = board_detailService.selectBoardOne(boardNo);
        
        model.addAttribute("boardInfo", boardInfo);
        model.addAttribute("boardTypeCode", boardTypeCode);
        
        return "board/boardReadTest";
	}
	
	/**
	 * 
	* Method : boardUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @param model
	* @return
	* @throws Exception
	* Method 설명 : 게시글 수정
	 */
	@RequestMapping(value = "/boardUpdate")
	public String boardUpdate(String boardNo, Model model) throws Exception {
	        
		Board_detailVo boardInfo = board_detailService.selectBoardOne(boardNo);
	        
		model.addAttribute("boardInfo", boardInfo);
	        
	    return "board/boardUpdateTest";
	}
	
	@RequestMapping(value = "/boardUpdateSave")
	public String board1UpdateSave(@ModelAttribute("boardInfo") Board_detailVo boardInfo) throws Exception {
	        
		board_detailService.updateBoard(boardInfo);
	        
	    return "redirect:/boardList";
	}


}
