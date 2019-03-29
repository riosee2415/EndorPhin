package kr.or.ddit.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.board.service.IAttach_boardService;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.board.service.ICommentsService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;


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
	* Method 설명 : 게시글 리스트 조회
	 */
	@RequestMapping(path="/postList", method=RequestMethod.GET)
	public String postList(PageVo pageVo, Model model, String boardTypeName){
		
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
	* Method 설명 : 게시글 상세 조회
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
		return "boardDetail";
	}
	
	@RequestMapping(path="/postInsert",method=RequestMethod.GET)
	public String postInsert(Model model, String boardTypeCode, String boardTypeName){
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		return"postInsert";
	}
	
	@RequestMapping(path="/postInsert",method=RequestMethod.POST)
	public String postInsert(Model model, @RequestParam(value="boardTypeCode")String boardTypeCode, @RequestParam(value="boardTypeName")String boardTypeName,
							HttpServletRequest request, MultipartRequest multipart, Board_detailVo board_detailVo) throws Exception{
		HttpSession session = request.getSession();
		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("employeeVo");
		board_detailVo.setUserId(employeeVo.getUserId());
		
		model.addAttribute("boardTypeCode", boardTypeCode);
		model.addAttribute("boardTypeName", boardTypeName);
		
		List<Attach_boardVo> attachList =  new ArrayList<>();
		List<MultipartFile> attachFiles = multipart.getFiles("attachFile");
		
		String attachName = "";
		String attachRealname = "";
		String attachRealpath = "";
		
		for (MultipartFile multipartFile : attachFiles) {
			
			if(!multipartFile.getName().equals("attachFile")){
				continue;
			}
			
			ServletContext application = session.getServletContext();
			String path = application.getRealPath("/upload");
			
			attachName = multipartFile.getOriginalFilename();
			attachRealname = path + File.separator + UUID.randomUUID().toString();
			attachRealpath = path;
			
			if (multipartFile.getSize() > 0 ) {
				
				multipartFile.transferTo(new File(attachRealname));
				
				Attach_boardVo attachVo = new Attach_boardVo();
				attachVo.setAttachName(attachName);
				attachVo.setAttachRealname(attachRealname);
				attachVo.setAttachRealpath(attachRealpath);
				
				attachList.add(attachVo);
			}
		}
		
		board_detailService.postInsert(board_detailVo, attachList);
		return "redirect:boardDetail?boardNo=" + board_detailVo.getBoardNo();
	}
	
	@RequestMapping(path="/deletecomment",method=RequestMethod.POST)
	public String deleteComment(String boardNo, String boardTypeName, Model model){
		commentsService.deleteComments(boardNo);
		model.addAttribute("boardTypeName",boardTypeName);
		return "redirect:boardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(path="/writecomment",method=RequestMethod.POST)
	public String writeComment(Model model,CommentsVo commentsVo ,String userId, String boardNo, String boardTypeName){
		commentsVo.setCommentUser(userId);
		
		commentsService.insertComments(commentsVo);
		model.addAttribute("boardTypeName",boardTypeName);
		
		return "redirect:boardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(path="/deletepost",method=RequestMethod.GET)
	public String deletePost(Model model, String boardNo, String boardTypeName){
		board_detailService.postDelete(boardNo);
		model.addAttribute("boardTypeName",boardTypeName);
//		attach_boardService.attach_boardDelete(boardNo);
//		commentsService.deleteComments(boardNo);
		return "redirect:postList?boardNo=" +boardNo;
	}
}
