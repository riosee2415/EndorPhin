package kr.or.ddit.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.board.service.IBoard_TypeService;

@Controller
public class Board_TypeController {
	
	@Resource(name="board_TypeService")
	private IBoard_TypeService board_TypeService;
	
	@RequestMapping(path="/boardType", method=RequestMethod.GET)
	public String boardType(Model model){
		List<Board_TypeVo> boardAllList = board_TypeService.boardAllList();
		model.addAttribute("boardAllList", boardAllList);
		
		return "board/boardType";
	}
	@RequestMapping(path="/boardType", method=RequestMethod.POST)
	public String boardType(Board_TypeVo board_TypeVo, HttpServletRequest req){
		String type = req.getParameter("type");
		String boardTypeName = req.getParameter("boardTypeName");
		String useStatus = req.getParameter("useStatus");
		
		board_TypeVo.setBoardTypeName(boardTypeName);
		board_TypeVo.setUseStatus(useStatus);
		
		if(type.equals("create")){
			board_TypeService.insertBoard(board_TypeVo);
			
		}else{
			String boardTypeCode = req.getParameter("boardTypeCode");
			
			board_TypeVo.setBoardTypeCode(boardTypeCode);
			board_TypeService.updateBoard(board_TypeVo);
		}
		
		return "redirect:/boardType";
		
	}
	
}
