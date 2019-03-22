package kr.or.ddit.employee.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;

@RequestMapping("/employee")
@Controller
public class EmployeeController {

	@Resource(name = "employeeService")
	private IEmployeeService employeeService;

	
	
	
	
	
	
	
	@RequestMapping(path = "/getAllEmployee", method = RequestMethod.GET)
	public String getAllEmployee(Model model) {
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		
		
		model.addAttribute("allEmployee",allEmployee);
		
		
		return "employeeListTiles";
	}
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee(Model model) {
		
		return "insertEmployeeTiles";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	@RequestMapping("/userAllList")
//	public String userAllList(Model model) {
//
//		List<UserVO> userList = userService.getAllUser();
//
//		model.addAttribute("userList", userList);
//		return "userAllListTiles";
//		//return "user/userAllList";
//
//	}
//
//	@RequestMapping("/userPagingList")
//	public String userPagingList(PageVO pageVo, Model model) {
//
//		// PageVO pageVo = new PageVO(page, pageSize);
//
//		Map<String, Object> resultMap = userService.selectUserPagingList(pageVo);
//		model.addAllAttributes(resultMap);
//
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		return "userPagingListTiles";
//		//return "user/userPagingList";
//
//	}
//	/**
//	* Method : userPagingListAjaxView
//	* ?��?��?�� : leemjaewoo
//	* �?경이?�� :
//	* @return
//	* Method ?���? : ?��?��?�� ?��?���? 리스?�� view
//	*/
//	@RequestMapping("/userPagingListAjaxView")
//	public String userPagingListAjaxView() {
//		
//		return "userPagingListAjaxTiles";
//
//	}
//
//	@RequestMapping(path = "/user", method = RequestMethod.GET)
//	public String user(@RequestParam("userId") String userId, Model model) {
//
//		UserVO userVo = userService.selectUser(userId);
//		model.addAttribute("uservo", userVo);
//		return "userTiles";
//		//return "user/user";
//	}
//
//	@RequestMapping("/profileImg")
//	public void profileImg(HttpServletRequest request, HttpServletResponse response,
//			@RequestParam("userId") String userId) throws IOException {
//
//		response.setHeader("content-Disposition", "attachment; filename=profile.png");
//		response.setContentType("image.png");
//
//		UserVO vo = userService.selectUser(userId);
//		FileInputStream fis;
//		if (vo != null && vo.getRealFilename() != null) {
//			fis = new FileInputStream(new File(vo.getRealFilename()));
//		} else {
//
//			ServletContext application = request.getServletContext();
//			String noimgPath = application.getRealPath("/upload/noimage.jpg");
//			fis = new FileInputStream(new File(noimgPath));
//		}
//
//		ServletOutputStream sos = response.getOutputStream();
//
//		byte[] buff = new byte[512];
//		int len = 0;
//		while ((len = fis.read(buff)) > -1) {
//			sos.write(buff);
//		}
//
//		sos.close();
//		fis.close();
//
//	}
//
//	/**
//	 * Method : userForm ?��?��?�� : leemjaewoo �?경이?�� :
//	 * 
//	 * @return Method ?���? : ?��?��?�� ?��록폼 ?���?
//	 */
//	@RequestMapping(path = "/userForm", method = RequestMethod.GET)
//	public String userForm() {
//		return "user/userForm";
//	}
//
//	@RequestMapping(path = "/userForm", method = RequestMethod.POST)
//	public String userForm(UserVO userVo, @RequestPart("profile") MultipartFile profile, HttpSession session,
//			Model model) throws IllegalStateException, IOException {
//
//		UserVO selectUser = userService.selectUser(userVo.getUserId());
//
//		// 중복체크 ?���?(?��규등�?)
//		if (selectUser == null) {
//			// ?��?��?�� ?��로파?�� ?��로드 ?��경우
//
//			String filename = "";
//			String realFilename = "";
//
//			if (profile.getSize() > 0) {
//				filename = profile.getOriginalFilename();
//				realFilename = ("c:\\picture\\" + UUID.randomUUID().toString());
//				profile.transferTo(new File(realFilename));
//
//			}
//			userVo.setFilename(filename);
//			userVo.setRealFilename(realFilename);
//
//			int cnt = 0;
//			try {
//				cnt = userService.insertUser(userVo);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			// ?��?��?��?�� ?���?
//			if (cnt == 1) {
//				session.setAttribute("msg", "?��?�� ?���? ?��?��?��?��?��");
//				return "redirect:/user/userPagingList"; // contextPath ?��?��?��?��
//
//			}
//			// ?��?��?��?�� ?��?��
//			else {
//
//				return "/user/userForm";
//			}
//
//		}
//		// 중복체크 ?��?��
//		else {
//			model.addAttribute("msg", "중복체크?�� ?��?�� ?��?��?��?��.");
//			return "/user/userForm";
//		}
//
//	}
//
//	@RequestMapping(path = "/usermodifyformcontroller", method = RequestMethod.GET)
//	public String userModify_get(@RequestParam("userId") String userId, Model model) {
//
//		UserVO uservo = userService.selectUser(userId);
//
//		model.addAttribute("uservo", uservo);
//
//		return "user/userModify";
//	}
//
//	@RequestMapping(path = "/usermodifyformcontroller", method = RequestMethod.POST)
//	public String userModify_post(UserVO uservo, @RequestPart("profile") MultipartFile profile, HttpSession session,
//			Model model, HttpServletRequest request, RedirectAttributes ra) throws IllegalStateException, IOException {
//
//		
//
//			String filename = "";
//			String realFilename = "";
//
//			
//				if(profile.getSize()>0){
//					
//				filename = profile.getOriginalFilename();
//				realFilename = ("c:\\picture\\" + UUID.randomUUID().toString());
//				profile.transferTo(new File(realFilename));
//				}
//
//				uservo.setFilename(filename);
//				uservo.setRealFilename(realFilename);
//				
//				//?��?��?�� 비�?번호 ?��?��?��
//				
//				//비�?번호 ?��?�� ?���??���?
//				//?��?��?���? 값을 ?��?��?���? ?��??경우 => 기존 비�?번호 ?���?
//				if(uservo.getPass().equals("")){
//					UserVO userVoForPass = userService.selectUser(uservo.getUserId());
//					uservo.setPass(userVoForPass.getPass());
//				}
//				//?��?��?���? 비�?번호�? ?���? ?��록한 경우
//				else{
//					uservo.setPass(KISA_SHA256.encrypt(uservo.getPass()));
//				}
//				
//				
//				
//
//			int cnt = 0;
//			try {
//				cnt = userService.updateUser(uservo);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			// ?��?��?��?�� ?���?
//			// ?��?��?�� ?���? ?��?�� ?��?�� : ?��?��?�� ?��?�� 조회 ?��?���? ?��?��
//			if (cnt == 1) {
//				/*
//				  
//				 redirect ?��?��미터�? 보내?�� 방법
//				1.url�? ?��?��
//				 "redirect:/user/user?userId=" + userVo.getUserId();
//				2.model객체?�� ?��?�� : ???��?�� ?��?��?�� ?��?��?���? ?��?��미터 �??��
//				model.addAttrubute("userId", userVo.getUserId());
//				 return "redirect:/user/user";
//				3. RedirectAtrribute(ra) 객체�? ?��?��
//				 return "redirect:/user/user";
//				 */
//				ra.addAttribute("userId" , uservo.getUserId());
//				ra.addFlashAttribute("msg", "?��?�� ?���? ?��?��?��?��?��");
//				//session.setAttribute("msg", "?��?�� ?���? ?��?��?��?��?��");
//				//model.addAttribute("userId", uservo.getUserId());
//				//return "redirect" + request.getContextPath() + " :/user/user"; // contextPath ?��?��?��?��
//				return "redirect:/user/user"; // contextPath ?��?��?��?��
//
//			}
//			// ?��?��?��?�� ?��?��
//			else {
//
//				return "/user/userForm";
//			}
//
//
//	}
//	
//	
//	/**
//	* Method : userPagingListAjax
//	* ?��?��?�� : leemjaewoo
//	* �?경이?�� :
//	* @param pageVo
//	* @param model
//	* @return
//	* Method ?���? : ?��?��?�� ?��?���? 리스?�� ajax ?���?처리
//	*/
//	@RequestMapping("/userPagingListAjax")
//	public String userPagingListAjax(PageVO pageVo, Model model) {
//
//		// PageVO pageVo = new PageVO(page, pageSize);
//
//		Map<String, Object> resultMap = userService.selectUserPagingList(pageVo);
//		model.addAllAttributes(resultMap);
//
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		
//		//userList, userCnt, pageSize, page
//		// { userList : [ {userId : 'brown', userNm : '브라?��}... {userId : 'sally', userNm : '?���?'}]
//		//  userCnt : "110",
//		// pageSize : "10",
//		// page     :  2}
//		
//		return "jsonView";
//
//	}
//	
//	@RequestMapping("/userPagingListAjaxHtml")
//	public String userPagingListAjaxHtml(PageVO pageVo, Model model) {
//
//		// PageVO pageVo = new PageVO(page, pageSize);
//
//		Map<String, Object> resultMap = userService.selectUserPagingList(pageVo);
//		model.addAllAttributes(resultMap);
//		model.addAttribute("pageSize", pageVo.getPageSize());
//		model.addAttribute("page", pageVo.getPage());
//		
//		return "user/userPagingListAjaxHtml";
//
//	}
//	
//	
//
//
//
//
//
//
//








}
