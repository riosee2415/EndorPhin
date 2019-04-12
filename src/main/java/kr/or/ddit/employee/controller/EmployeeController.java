package kr.or.ddit.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.employee.service.IEmployeeDetailService;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;

@RequestMapping("/employee")
@Controller
public class EmployeeController {
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	@Resource(name = "employeeDetailService")
	private IEmployeeDetailService employeeDetailService;
	
	@Resource(name="imagesService")
	private IImagesService imagesService;
	
	
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
	public String insertEmployee_POST(Model model, EmployeeVo vo,RedirectAttributes ra,
			MultipartRequest multparts) throws IllegalStateException, IOException {
		
		
		
		ImagesVo imageVo = new ImagesVo();
		Employee_detailVo detailVo = new Employee_detailVo();
		imageVo.setUserId(vo.getUserId());

		
		
		employeeService.insertEmployee(vo);
		
		String imageCode = imagesService.updateOrInsertImages(imageVo, multparts);
		detailVo.setUserId(vo.getUserId());
		detailVo.setImagecode(imageCode);
		employeeDetailService.insertEmployeeDetail(detailVo);
		
		
		
		
		
		
		
//		if(multparts != null){
//			
//		MultipartFile file = multparts.getFile("realFilename");
//		ImagesVo imageVo = new ImagesVo();
//		
//		String file_name = "";
//		String file_path = "";
//		
//		
//		
//		if (file.getSize() > 0) {
//			file_name = file.getOriginalFilename();
//			file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
//			file.transferTo(new File(file_path));
//			
//			imageVo.setUserId(vo.getUserId());
//			imageVo.set
//			
//			
//			
//			detailVo.setImg_name(file_name);
//			detailVo.setImg_path(file_path);
//
//			
//		}
//		
//		}					 
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/employee/getAllEmployee";
	}
	
	@RequestMapping(path = "/deleteEmployee", method = RequestMethod.GET)
	public String deleteEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String delete_no) {
		
		
		String[] index = delete_no.split(",");
		
		for (int i = 0; i < index.length; i++) {
			employeeService.deleteEmployee(index[i]);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		
		return "redirect:/employee/getAllEmployee";
	}
	
	@RequestMapping(path = "/detailEmployee", method = RequestMethod.GET)
	public String detailEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String userId) {
		
		EmployeeVo selectEmployee = employeeService.selectEmployee(userId);
		Employee_detailVo selectEmployeeDetail = employeeDetailService.selectEmployeeDetail(userId);
		
		model.addAttribute("userVo",selectEmployee);
		model.addAttribute("img",selectEmployeeDetail);
		
		return "employeeDetailTiles";
	}
	
	
	@RequestMapping(path = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		
		
		return "testTiles";
	}
	
	
	@RequestMapping(path="/emplIdAjax", method=RequestMethod.POST)
	@ResponseBody
	public String emplIdAjax(@RequestParam(name="userId", defaultValue="WS")String userId) {
		
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		String userIdCode = "1";
		
		for(int i = 0; i < allEmployee.size(); i++) {
			// Duplicate Code = 0
			if(userId.equals(allEmployee.get(i).getUserId())){
				userIdCode = "0";
				return userIdCode;
				
			// WhiteSpace Code = WS
			} else if(userId.equals("WS")) {
				userIdCode = "WS";
				return userIdCode;
			}
		}
		
		return userIdCode;
		
		
	}
	       
	
	@RequestMapping("/profileImg")
	public void profileImg(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("userId") String userId) throws IOException {
		
		

		//response.setHeader("content-Disposition", "attachment; filename=profile.png");
		//response.setContentType("image.png");
		
		
		Employee_detailVo vo = employeeDetailService.selectEmployeeDetail(userId);

		
		String Img_path = vo.getImagerealpath() + vo.getImagerealname();
		
		System.out.println("경로 :" + Img_path);
		
		FileInputStream fis;
		if (vo != null && vo.getImagename() != null) {
			fis = new FileInputStream(new File(Img_path));
		} else {

			ServletContext application = request.getServletContext();
			String noimgPath = application.getRealPath("/upload/noimage.jpg");
			fis = new FileInputStream(new File(noimgPath));
		}

		ServletOutputStream sos = response.getOutputStream();

		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}

		sos.close();
		fis.close();

	}
	
	@RequestMapping(path = "/updateEmployee", method = RequestMethod.GET)
	@ResponseBody
	public EmployeeVo updateEmployee_GET(String userId,RedirectAttributes ra) throws IllegalStateException, IOException {
		logger.debug("userId : {}", userId);
		
		EmployeeVo selectEmpl = employeeService.selectEmployee(userId);
		return selectEmpl;
	}
	
	@RequestMapping(path = "/updateEmployee_POST", method = RequestMethod.POST)
	public String updateEmployee_POST(EmployeeVo vo,RedirectAttributes ra) {
		logger.debug("수정 서블릿 : {}" ,vo);
		
		
		
		employeeService.updateEmployee(vo);
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		return "redirect:/employee/getAllEmployee";
	}
	
	
	@RequestMapping(path = "/SearchEmployee", method = RequestMethod.GET)
	public String SearchEmployee(Model model, String searchName, String deptselect) {
		EmployeeVo vo = new EmployeeVo();
		
		vo.setUserId(searchName);
		
		vo.setDeptname(deptselect);
		
		
		List<EmployeeVo> allEmployee = employeeService.SearchEmployee(vo);
		
		
		model.addAttribute("allEmployee",allEmployee);
		
		return "employeeListTiles";
	}

	
	@RequestMapping(path="/getAllEmployeeAjax", method=RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> getAllEmployeeAjax(Model model) {
		
		
		return employeeService.getAllEmployee();
		
	}
	
	
	
	
	
	
	@RequestMapping(path = "/SearchEmployeeAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> SearchEmployeeAjax(Model model, String searchName, String deptselect) {
		EmployeeVo vo = new EmployeeVo();
		
		vo.setUserId(searchName);
		
		vo.setDeptname(deptselect);
		List<EmployeeVo> allEmployee = employeeService.SearchEmployee(vo);
		
		return allEmployee;
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
