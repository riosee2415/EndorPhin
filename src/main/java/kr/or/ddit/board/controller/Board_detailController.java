package kr.or.ddit.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.util.model.PageVo;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;


@Controller
public class Board_detailController {
	
	private static final Logger logger = LoggerFactory.getLogger(Board_detailController.class);

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
	* Method : boardDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @param model
	* @return
	* Method 설명 : 게시글 조회
	 */
	@RequestMapping(path="/postList", method=RequestMethod.GET)
	public String boardPage(PageVo pageVo, Model model, String boardTypeName){
		
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		model.addAllAttributes(resultMap);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		model.addAttribute("boardTypeName", boardTypeName);
		
		return "postList";
	}
	
	/**
	 * 
	* Method : boarddetail
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세
	 */
	@RequestMapping(path="/boardDetail",method=RequestMethod.GET)
	public String boardDetail(Model model, Board_detailVo board_detailVo, String boardNo, String boardTypeName, String boardTypeCode){
		
		Map<String, Object> resultMap = board_detailService.postDetail(boardNo);
		
		Board_detailVo post = (Board_detailVo) resultMap.get("post");
		List<Attach_boardVo> attachList = (List<Attach_boardVo>) resultMap.get("attachList");
		List<CommentsVo> commentList = (List<CommentsVo>) resultMap.get("commentList");
		
		model.addAllAttributes(resultMap);
		model.addAttribute("post", post);
		model.addAttribute("attachList", attachList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		return "test";
	}
	
	
	@RequestMapping(path="/postInsert",method=RequestMethod.GET)
	public String boardInsert(Board_detailVo board_detailVo, Model model, String cnt){
		
		model.addAttribute("boardTypeCode", board_detailVo.getBoardTypeCode());
		model.addAttribute("cnt", cnt);
		
		return "board/postInsert";
	}
	
//	@RequestMapping(path="/postInsert",method=RequestMethod.POST)
//	public String boardInsert(Board_detailVo board_detailVo, Model model){
//		
//		model.addAttribute("boardTypeCode", board_detailVo.getBoardTypeCode());
//		model.addAttribute("cnt", cnt);
//		
//		return "board/postInsert";
//	}
}
