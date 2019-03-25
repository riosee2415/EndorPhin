package kr.or.ddit.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.PageVo;
import kr.or.ddit.board.service.IBoard_detailService;


@Controller
public class Board_detailController {

	@Resource(name="board_detailService")
	private IBoard_detailService board_detailService;
	
	@RequestMapping(path="/boardPage")
	public String boardDetail(PageVo pageVo, Model model){
		
		Map<String, Object> resultMap = board_detailService.selectPagePost(pageVo);
		
		model.addAllAttributes(resultMap);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("boardTypeCode", pageVo.getBoardTypeCode());
		
		
		return "board/boardPage";
	}
	
	@RequestMapping(path="/postInsert")
	public String boardInsert(Board_detailVo board_detailVo, Model model, String cnt){
		
		model.addAttribute("boardTypeCode", board_detailVo.getBoardTypeCode());
		model.addAttribute("cnt", cnt);
		
		return "board/postInsert";
	}
	
	
}
