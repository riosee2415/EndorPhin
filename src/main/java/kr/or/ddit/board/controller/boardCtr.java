package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.slip.model.SlipVo;
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
    public String boardList(Model model, PageVo pageVo,@RequestParam(defaultValue="title")String searchType, @RequestParam(defaultValue="")String keyword,@RequestParam(defaultValue="")String startDate, @RequestParam(defaultValue="")String endDate) throws Exception {
//        List<Board_detailVo> listview = board_detailService.selectBoardList();
//        
//        model.addAttribute("listview", listview);
//        model.addAttribute("boardTypeCode", param.getBoardTypeCode());
//        return "board/boardListTest";
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		model.addAllAttributes(map);
		model.addAllAttributes(resultMap);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		return "boardList";
    }
	
	/**
	 * 
	* Method : boardForm
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* @throws Exception
	* Method 설명 : 게시글 작성
	 */
	@RequestMapping(value = "/boardForm")
	public String boardForm(Model model, String boardTypeCode, String boardNo) throws Exception {
		
        if (boardNo!=null) {
        	Board_detailVo boardInfo = board_detailService.selectBoardOne(boardNo);
        	model.addAttribute("boardInfo", boardInfo);
        }

		model.addAttribute("boardTypeCode", boardTypeCode);
		logger.debug("boardTypeCode : {}",boardTypeCode);
	    return "boardForm";
	}
	
	/**
	 * 
	* Method : boardSave
	* 작성자 : macbook
	* 변경이력 :
	* @param boardInfo
	* @return
	* @throws Exception
	* Method 설명 : 게시글 저장
	 */
	@RequestMapping(value = "/boardSave")
	public String boardSave(@ModelAttribute Board_detailVo boardInfo, HttpServletRequest request, String boardTypeCode, Model model) throws Exception {
//		HttpSession session = request.getSession();
//		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
//		boardInfo.setUserId(employeeVo.getUserId());
		if (boardInfo.getBoardNo() == null || "".equals(boardInfo.getBoardNo())) {
			board_detailService.insertBoard(boardInfo);
			model.addAttribute("boardTypeCode", boardTypeCode);
		} else {
			board_detailService.updateBoard(boardInfo);
			model.addAttribute("boardTypeCode", boardTypeCode);
		}
		
		model.addAttribute("boardTypeCode", boardTypeCode);
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
        List<CommentsVo> replylist = board_detailService.selectBoardReplyList(boardNo);

        
        model.addAttribute("boardInfo", boardInfo);
        model.addAttribute("boardTypeCode", boardTypeCode);
        model.addAttribute("replylist", replylist);
        
        return "boardRead";
	}
	
	/**
	 * 
	* Method : boardUpdateSave
	* 작성자 : macbook
	* 변경이력 :
	* @param boardInfo
	* @return
	* @throws Exception
	* Method 설명 : 게시글 수정버튼
	 */
	@RequestMapping(value = "/boardUpdateSave")
	public String board1UpdateSave(@ModelAttribute("boardInfo") Board_detailVo boardInfo, String boardTypeCode, Model model) throws Exception {
	        
		board_detailService.updateBoard(boardInfo);
	    model.addAttribute(boardTypeCode);
	    return "redirect:/boardList";
	}
	
	/**
	 * 
	* Method : boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @return
	* @throws Exception
	* Method 설명 : 게시글 삭제
	 */
	@RequestMapping(value = "/boardDelete")
    public String boardDelete(Model model,String boardNo,String boardTypeCode) throws Exception {
     
     board_detailService.deleteBoardOne(boardNo);
     model.addAttribute("boardTypeCode",boardTypeCode);
     return "redirect:/boardList";
	}
	
	/**
	 * 
	* Method : boardReplySave
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardReplyInfo
	* @return
	* Method 설명 : 댓글 등록
	 */
	@RequestMapping(value = "/boardReplySave")
    public String boardReplySave(Model model, CommentsVo boardReplyInfo, String boardTypeCode) {
        
		board_detailService.insertBoardReply(boardReplyInfo);
		model.addAttribute("boardTypeCode", boardTypeCode);

        return "redirect:/boardRead?boardNo=" + boardReplyInfo.getBoardNo();
    }

	/**
	 * 
	* Method : board5ReplyDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param request
	* @param boardReplyInfo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	@RequestMapping(value = "/boardReplyDelete")
    public String board5ReplyDelete(Model model ,HttpServletRequest request, CommentsVo boardReplyInfo, String boardTypeCode) {
        
		board_detailService.deleteBoardReply(boardReplyInfo.getCommentNo());
		model.addAttribute("boardTypeCode",boardTypeCode);

        return "redirect:/boardRead?boardNo=" + boardReplyInfo.getBoardNo();
    }


	/**
	 * 
	* Method : searchContents
	* 작성자 : macbook
	* 변경이력 :
	* @param model
	* @param boardNo
	* @param boardTypeCode
	* @param pageVo
	* @param startDate
	* @param endDate
	* @param contents
	* @return
	* @throws Exception
	* Method 설명 : 검색
	 */
//	@RequestMapping(value = "/searchSave")
//	public String searchContents(Model model, String boardNo, String boardTypeCode, PageVo pageVo,
//			String startDate, String endDate, String contents) throws Exception {
//		Map<String,Object> resultMap = board_detailService.selectBoardList(pageVo);
//		
//		List<Board_detailVo> contentsList = board_detailService.selectBoardcontens(startDate, endDate, contents);
//		model.addAttribute("contentsList", contentsList);
//		
//		model.addAllAttributes(resultMap);
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		model.addAttribute("boardTypeCode", boardTypeCode);
//		return "redirect:/boardList";
//	}
	
//	@RequestMapping(value = "/searchSave")
//	public String searchTitle(Model model, String boardNo, String boardTypeCode, PageVo pageVo,
//			String startDate, String endDate,String title) throws Exception {
//		Map<String,Object> resultMap = board_detailService.selectBoardList(pageVo);
//		
//		List<Board_detailVo> titleList = board_detailService.selectBoardTitle(startDate, endDate, title);
//		model.addAttribute("titleList", titleList);
//		
//		model.addAllAttributes(resultMap);
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		model.addAttribute("boardTypeCode", boardTypeCode);
//		return "redirect:/boardList";
//	}
	
//	@RequestMapping(value = "/searchSave")
//	public String searchUserId(Model model, String boardNo, String boardTypeCode, PageVo pageVo,
//			String startDate, String endDate, String userId, String selbox) throws Exception {
//		Map<String,Object> resultMap = board_detailService.selectBoardList(pageVo);
//		
//		List<Board_detailVo> userIdList = board_detailService.selectBoardUserId(startDate, endDate, userId);
//		model.addAttribute("userIdList", userIdList);
//		
//		model.addAllAttributes(resultMap);
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		model.addAttribute("boardTypeCode", boardTypeCode);
//		logger.debug("1238901231231231231--------{} {} {}",startDate,endDate, userId, selbox);
//		return "redirect:/boardList";
//	}
}
