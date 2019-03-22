package kr.or.ddit.employee.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;

@RequestMapping("/employee")
@Controller
public class EmployeeController {
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	@RequestMapping(path = "/getAllEmployee", method = RequestMethod.GET)
	public String getAllEmployee(Model model) {
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		
		
		model.addAttribute("allEmployee",allEmployee);
		
		
		return "employeeListTiles";
	}
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee_GET(Model model) {
		
		return "insertEmployeeTiles";
	}
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.POST)
	public String insertEmployee_POST(Model model, EmployeeVo vo,RedirectAttributes ra) {
		
		int insertEmployee = employeeService.insertEmployee(vo);
		
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/employee/getAllEmployee";
	}
	
	
	
	
	
	
	
	
	
	
//	
//	@RequestMapping("/boardTypeList")
//	public String boardTypeList(Model model) {
//
//		List<BoardTypeVO> Typelist = boardService.getAllBoardType();
//
//		model.addAttribute("Typelist", Typelist);
//		return "boardtypeListTiles";
//
//	}
//
//	/**
//	 * Method : boardTypeProduce 작성자 : leemjaewoo 변경이력 :
//	 * 
//	 * @param model
//	 * @return Method 설명 : 보드타입 생성
//	 */
//	@RequestMapping("/boardTypeProduce")
//	public String boardTypeProduce(BoardTypeVO vo, String boardname, String select, String boardcode, String boardName,
//			String lang, Model model, RedirectAttributes ra) {
//
//		// 게시판생성 인서트
//		if (boardname != null && select != null) {
//			vo.setBoard_name(boardname);
//			vo.setBoard_activation(select);
//			boardService.insertBoardType(vo);
//
//			// 게시판수정
//		} else {
//			vo.setBoard_code(boardcode);
//			vo.setBoard_name(boardName);
//			vo.setBoard_activation(lang);
//
//			boardService.updateboardtype(vo);
//
//		}
//
//		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
//		return "redirect:/board/boardTypeList"; // contextPath 작업필요
//	}
//
//	/**
//	 * Method : boardpagingList 작성자 : leemjaewoo 변경이력 :
//	 * 
//	 * @param model
//	 * @return Method 설명 : 게시판 페이징리스트,목록
//	 */
//
//	@RequestMapping("/boardpagingList")
//	public String boardpagingList(PageVO pageVo, Model model, HttpServletRequest request) {
//
//		if (request.getParameter("board_code") != null) {
//			String board_code = request.getParameter("board_code");
//			request.getSession().setAttribute("boardcode", board_code);
//		}
//
//		String boardcodeGet = (String) request.getSession().getAttribute("boardcode");
//		pageVo.setPageboard_code(boardcodeGet);
//
//		Map<String, Object> resultMap = boardService.selectPostPagingList(pageVo);
//		model.addAllAttributes(resultMap);
//
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		return "boardPagingListTiles";
//
//	}
//
//	@RequestMapping(path="/boardDetail", method = {RequestMethod.GET})
//	public String boardDetail_GET(Model model, @RequestParam("post_no") String post_no) {
//
//		BoardPostVO boardvo = boardService.selectPost(post_no);
//		List<BoardCommentVO> commentvo = boardService.selectBoardComment(post_no);
//		List<BoardFileVO> fileList = boardService.selectBoardFile(post_no);
//
//		model.addAttribute("boardvo", boardvo);
//		model.addAttribute("commentvo", commentvo);
//		model.addAttribute("fileList", fileList);
//
//		return "boardDetailListTiles";
//
//	}
//	@RequestMapping(path="/boardDetail", method = {RequestMethod.POST})
//	public String boardDetail_POST(Model model, @RequestParam("post_no") String post_no,
//			@RequestParam("userid")String userid,@RequestParam("comment_contents")String comment_contents) {
//		
//		
//		
//		BoardCommentVO vo = new BoardCommentVO();
//		vo.setCommnet_contents(comment_contents);
//		vo.setPost_no(post_no);
//		vo.setUserid(userid);
//		vo.setStatus("0");
//		
//		boardService.insertBoardComment(vo);
//		
//		return "redirect:/board/boardDetail?post_no=" + post_no;
//		
//	}
//
//	@RequestMapping(path = { "/boardform" }, method = { RequestMethod.GET })
//	public String boardform_get(Model model) {
//
//		return "board/boardForm";
//
//	}
//
//	@RequestMapping(path = { "/boardform" }, method = { RequestMethod.POST })
//	public String boardform_post(HttpServletRequest request, Model model, @RequestParam("postTitle") String post_title,
//			@RequestParam("smarteditor") String smarteditor, MultipartRequest multparts, RedirectAttributes ra)
//			throws IllegalStateException, IOException {
//
//		UserVO userVo = (UserVO) request.getSession().getAttribute("userVo");
//		String boardcode = (String) request.getSession().getAttribute("boardcode");
//		List<MultipartFile> parts = multparts.getFiles("realuploadFile");
//
//		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
//		String file_name = "";
//		String file_path = "";
//
//		for (MultipartFile part : parts) {
//			logger.debug("contentDisposition : {}", part.getOriginalFilename());
//
//			if (part.getSize() > 0) {
//				file_name = part.getOriginalFilename();
//				file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
//				part.transferTo(new File(file_path));
//
//				BoardFileVO boardFileInsertVo = new BoardFileVO();
//				boardFileInsertVo.setUpload_name(file_name);
//				boardFileInsertVo.setRealfilename(file_path);
//
//				boardFileList.add(boardFileInsertVo);
//			}
//
//		}
//
//		BoardPostVO boardPostVO = new BoardPostVO();
//
//		boardPostVO.setUserid(userVo.getUserId());
//		boardPostVO.setPost_title(post_title);
//		boardPostVO.setPost_contents(smarteditor);
//		boardPostVO.setBoard_code(boardcode);
//		boardPostVO.setStatus("0");
//
//		int cnt = boardService.insertBoardPost(boardPostVO, boardFileList);
//		if (cnt == 1) {
//			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
//			return "redirect:/board/boardpagingList?board_code=" + boardcode;
//		}
//
//		return "";
//
//	}
//
//	@RequestMapping(path = { "/boardEdit" }, method = { RequestMethod.GET })
//	public String boardEdit_GET(@RequestParam String post_no, Model model) {
//		BoardPostVO Postlist = boardService.selectPost(post_no);
//		List<BoardFileVO> filelist = boardService.selectBoardFile(post_no);
//
//		model.addAttribute("Postlist", Postlist);
//		model.addAttribute("filelist", filelist);
//
//		return "boardEditListTiles";
//	}
//
//	@RequestMapping(path = { "/boardEdit" }, method = { RequestMethod.POST })
//	public String boardEdit_POST(HttpServletRequest request, Model model, @RequestParam("postTitle") String post_title,
//			@RequestParam("smarteditor") String smarteditor, MultipartRequest multparts, RedirectAttributes ra) throws IllegalStateException, IOException {
//		String[] removeList = request.getParameterValues("removeList");
//
//		
//		BoardPostVO boardpostvo = new BoardPostVO();
//		
//		boardpostvo.setPost_title(request.getParameter("postTitle"));
//		boardpostvo.setPost_contents(request.getParameter("smarteditor"));
//		boardpostvo.setPost_no(request.getParameter("post_code"));
//		boardpostvo.setStatus("0");
//		
//		List<MultipartFile> parts = multparts.getFiles("realuploadFile");
//
//		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
//		String file_name = "";
//		String file_path = "";
//
//		for (MultipartFile part : parts) {
//			logger.debug("contentDisposition : {}", part.getOriginalFilename());
//
//			if (part.getSize() > 0) {
//				file_name = part.getOriginalFilename();
//				file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
//				part.transferTo(new File(file_path));
//
//				BoardFileVO boardFileInsertVo = new BoardFileVO();
//				boardFileInsertVo.setUpload_name(file_name);
//				boardFileInsertVo.setRealfilename(file_path);
//
//				boardFileList.add(boardFileInsertVo);
//			}
//
//		}
//
//
//		int cnt = boardService.updateBoardPostFile(boardpostvo, boardFileList, removeList);
//		if (cnt == 1) {
//			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
//			return "redirect:/board/boardDetail?post_no=" + request.getParameter("post_code");
//		}else{
//			
//			return "boardEditListTiles";
//		}
//	}
//	
//	@RequestMapping(path = { "/boardDelete" }, method = { RequestMethod.GET })
//	public String boardDelete(Model model, @RequestParam("post_no") String post_no,HttpServletRequest request,
//			RedirectAttributes ra) {
//		
//		BoardPostVO vo = new BoardPostVO();
//		
//		vo.setPost_title("");
//		vo.setPost_contents("");
//		vo.setStatus("1");
//		vo.setPost_no(post_no);
//		
//		boardService.deleteBoardPost(vo);
//		String boardcode = (String) request.getSession().getAttribute("boardcode");
//
//		
//		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
//		return "redirect:/board/boardpagingList?board_code=" + boardcode;
//
//	}
//	@RequestMapping(path = { "/boardDapgle" }, method = { RequestMethod.GET })
//	public String boardDapgle_GET(Model model, @RequestParam("post_no")String post_no) {
//		
//		BoardPostVO postvo = boardService.selectPost(post_no);
//		
//		model.addAttribute("postvo",postvo);
//		
//		return "boardDapgleTiles";
//		
//	}
//	@RequestMapping(path = { "/boardDapgle" }, method = { RequestMethod.POST })
//	public String boardDapgle_POST(HttpServletRequest request, Model model, @RequestParam("postTitle") String post_title,
//			@RequestParam("smarteditor") String smarteditor, MultipartRequest multparts, RedirectAttributes ra)
//			throws IllegalStateException, IOException {
//
//		UserVO userVo = (UserVO) request.getSession().getAttribute("userVo");
//		String boardcode = (String) request.getSession().getAttribute("boardcode");
//		List<MultipartFile> parts = multparts.getFiles("realuploadFile");
//
//		List<BoardFileVO> boardFileList = new ArrayList<BoardFileVO>();
//		String file_name = "";
//		String file_path = "";
//
//		for (MultipartFile part : parts) {
//			logger.debug("contentDisposition : {}", part.getOriginalFilename());
//
//			if (part.getSize() > 0) {
//				file_name = part.getOriginalFilename();
//				file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
//				part.transferTo(new File(file_path));
//
//				BoardFileVO boardFileInsertVo = new BoardFileVO();
//				boardFileInsertVo.setUpload_name(file_name);
//				boardFileInsertVo.setRealfilename(file_path);
//
//				boardFileList.add(boardFileInsertVo);
//			}
//
//		}
//
//		BoardPostVO boardPostVO = new BoardPostVO();
//
//		boardPostVO.setUserid(userVo.getUserId());
//		boardPostVO.setPost_title(post_title);
//		boardPostVO.setPost_contents(smarteditor);
//		boardPostVO.setBoard_code(boardcode);
//		boardPostVO.setStatus("0");
//		boardPostVO.setParentpost_no(request.getParameter("postNumber"));
//
//		int cnt = boardService.insertBoardPost(boardPostVO, boardFileList);
//		if (cnt == 1) {
//			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
//			return "redirect:/board/boardpagingList?board_code=" + boardcode;
//		}
//
//		return "";
//
//	}
//	
//	@RequestMapping(path="/boardDownload", method = {RequestMethod.GET})
//	public String boardDownload(@RequestParam("post_no") String post_no,HttpServletResponse response) throws IOException {
//		
//			List<BoardFileVO> selectBoardFile = boardService.selectBoardFile(post_no);
//		
//		
//			for(BoardFileVO filevo: selectBoardFile){
//			response.setHeader("content-Disposition", "attachment; filename=\""+filevo.getUpload_name()+"\""); 
//			response.setContentType("application/octet-stream");
//			
//			FileInputStream fis;
//			fis = new FileInputStream(new File(filevo.getRealfilename()));
//		
//			ServletOutputStream sos = response.getOutputStream();
//			
//			
//			byte[] buff = new byte[512];
//			int len = 0;
//			while( (len = fis.read(buff)) > -1 ) {
//				sos.write(buff);
//			}
//			
//			sos.close();
//			fis.close();
//			
//			}
//
//
//		return "";
//	}
//	
//	
//	
//	
//	@RequestMapping(path = { "/commentdelete" })
//	public String commentdelete(Model model, @RequestParam("comment_no")String comment_no,
//			@RequestParam("post_no")String post_no) {
//		
//		logger.debug("comment_no : {}",comment_no);
//		logger.debug("post_no : {}",post_no);
//		
//		boardService.commentdelete(comment_no);
//		
//		return "redirect:/board/boardDetail?post_no=" + post_no;
//		
//		
//	}
//	
	
	
	
	
	
	







}
