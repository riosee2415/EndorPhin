package kr.or.ddit.Attitude.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.Attitude.service.IAttitudeService;
import kr.or.ddit.employee.model.EmployeeVo;

@RequestMapping("/attitude")
@Controller
public class AttitudeController {
	private Logger logger = LoggerFactory.getLogger(AttitudeController.class);

	@Resource(name = "attitudeService")
	private IAttitudeService attitudeService;

	@RequestMapping(path = "/getAllAttitude", method = RequestMethod.GET)
	public String getAllEmployee(Model model) {

		List<AttitudeVo> allAttitude = attitudeService.getAllAttitude();

		model.addAttribute("allAttitude", allAttitude);

		return "AttitudeListTiles";
	}

	@RequestMapping(path = "/insertAttitude", method = RequestMethod.GET)
	public String insertAttitude(Model model, AttitudeVo vo, RedirectAttributes ra) {

		int insertAttitude = attitudeService.insertAttitude(vo);

		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/attitude/getAllAttitude";
	}

	@RequestMapping(path = "/AttitudeIdAjax", method = RequestMethod.POST)
	@ResponseBody
	public String AttitudeIdAjax(@RequestParam(name = "userId", defaultValue = "WS") String userId) {

		List<AttitudeVo> allAttitude = attitudeService.getAllAttitude();
		String userIdCode = "1";

		for (int i = 0; i < allAttitude.size(); i++) {
			// Duplicate Code = 0
			if (userId.equals(allAttitude.get(i).getAttitudeCode())) {
				userIdCode = "0";
				return userIdCode;

				// WhiteSpace Code = WS
			} else if (userId.equals("WS")) {
				userIdCode = "WS";
				return userIdCode;
			}
		}

		return userIdCode;

	}

	@RequestMapping(path = "/deleteAttitude", method = RequestMethod.GET)
	public String deleteAttitude(Model model, String delete_no, RedirectAttributes ra) {

		attitudeService.deleteAttitude(delete_no);

		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		return "redirect:/attitude/getAllAttitude";
	}

	@RequestMapping(path = "/searchAttitude", method = RequestMethod.GET)
	public String searchAttitude(Model model, String search) {

		AttitudeVo vo = new AttitudeVo();

		vo.setAttitudeName(search);

		List<AttitudeVo> allAttitude = attitudeService.SearchAttitude(vo);

		model.addAttribute("allAttitude", allAttitude);

		return "AttitudeListTiles";
	}

	@RequestMapping(path = "/updateAttitude", method = RequestMethod.GET)
	@ResponseBody
	public AttitudeVo updateAttitude_GET(String userId, RedirectAttributes ra)
			throws IllegalStateException, IOException {

		return attitudeService.SelectAttitude(userId);

	}

	@RequestMapping(path = "/updateAttitude", method = RequestMethod.POST)
	public String updateAttitude_POST(AttitudeVo vo, RedirectAttributes ra) {

		attitudeService.updateAttitude(vo);

		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		return "redirect:/attitude/getAllAttitude";

	}

	/*
	 * @RequestMapping(path = "/getAllEmployee", method = RequestMethod.GET)
	 * public String getAllEmployee(Model model) {
	 * 
	 * List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
	 * 
	 * 
	 * model.addAttribute("allEmployee",allEmployee);
	 * 
	 * 
	 * return "employeeListTiles"; }
	 * 
	 * @RequestMapping(path = "/insertEmployee", method = RequestMethod.GET)
	 * public String insertEmployee_GET(Model model) {
	 * 
	 * return "insertEmployeeTiles"; }
	 * 
	 * @RequestMapping(path = "/insertEmployee", method = RequestMethod.POST)
	 * public String insertEmployee_POST(Model model, EmployeeVo
	 * vo,RedirectAttributes ra, MultipartRequest multparts) throws
	 * IllegalStateException, IOException { employeeService.insertEmployee(vo);
	 * 
	 * MultipartFile file = multparts.getFile("realFilename"); Employee_detailVo
	 * detailVo = new Employee_detailVo();
	 * 
	 * String file_name = ""; String file_path = "";
	 * 
	 * 
	 * if (file.getSize() > 0) { file_name = file.getOriginalFilename();
	 * file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
	 * file.transferTo(new File(file_path));
	 * 
	 * detailVo.setUserId(vo.getUserId()); detailVo.setImg_name(file_name);
	 * detailVo.setImg_path(file_path);
	 * 
	 * }
	 * 
	 * 
	 * employeeDetailService.insertEmployeeDetail(detailVo);
	 * 
	 * ra.addFlashAttribute("msg", "정상 등록 되었습니다"); return
	 * "redirect:/employee/getAllEmployee"; }
	 * 
	 * @RequestMapping(path = "/deleteEmployee", method = RequestMethod.GET)
	 * public String deleteEmployee(Model model, EmployeeVo
	 * vo,RedirectAttributes ra,
	 * 
	 * @RequestParam String delete_no) { logger.debug("감자 : {}",delete_no);
	 * 
	 * 
	 * ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
	 * employeeService.deleteEmployee(delete_no);
	 * 
	 * return "redirect:/employee/getAllEmployee"; }
	 * 
	 * @RequestMapping(path = "/detailEmployee", method = RequestMethod.GET)
	 * public String detailEmployee(Model model, EmployeeVo
	 * vo,RedirectAttributes ra,
	 * 
	 * @RequestParam String userId) {
	 * 
	 * EmployeeVo selectEmployee = employeeService.selectEmployee(userId);
	 * Employee_detailVo selectEmployeeDetail =
	 * employeeDetailService.selectEmployeeDetail(userId);
	 * 
	 * model.addAttribute("userVo",selectEmployee);
	 * model.addAttribute("img",selectEmployeeDetail);
	 * 
	 * return "employeeDetailTiles"; }
	 * 
	 * 
	 * @RequestMapping(path = "/test", method = RequestMethod.GET) public String
	 * test(Model model) {
	 * 
	 * 
	 * return "testTiles"; }
	 * 
	 * 
	 * @RequestMapping(path="/emplIdAjax", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String emplIdAjax(@RequestParam(name="userId",
	 * defaultValue="WS")String userId) {
	 * 
	 * 
	 * List<EmployeeVo> allEmployee = employeeService.getAllEmployee(); String
	 * userIdCode = "1";
	 * 
	 * for(int i = 0; i < allEmployee.size(); i++) { // Duplicate Code = 0
	 * if(userId.equals(allEmployee.get(i).getUserId())){ userIdCode = "0";
	 * return userIdCode;
	 * 
	 * // WhiteSpace Code = WS } else if(userId.equals("WS")) { userIdCode =
	 * "WS"; return userIdCode; } }
	 * 
	 * return userIdCode;
	 * 
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @RequestMapping("/profileImg") public void profileImg(HttpServletRequest
	 * request, HttpServletResponse response,
	 * 
	 * @RequestParam("userId") String userId) throws IOException {
	 * 
	 * response.setHeader("content-Disposition",
	 * "attachment; filename=profile.png");
	 * response.setContentType("image.png"); logger.debug("이미지서브릿 : {}",userId);
	 * Employee_detailVo vo =
	 * employeeDetailService.selectEmployeeDetail(userId);
	 * 
	 * FileInputStream fis; if (vo != null && vo.getImg_name() != null) { fis =
	 * new FileInputStream(new File(vo.getImg_path())); } else {
	 * 
	 * ServletContext application = request.getServletContext(); String
	 * noimgPath = application.getRealPath("/upload/noimage.jpg"); fis = new
	 * FileInputStream(new File(noimgPath)); }
	 * 
	 * ServletOutputStream sos = response.getOutputStream();
	 * 
	 * byte[] buff = new byte[512]; int len = 0; while ((len = fis.read(buff)) >
	 * -1) { sos.write(buff); }
	 * 
	 * sos.close(); fis.close();
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping(path = "/updateEmployee", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public EmployeeVo updateEmployee_GET(String
	 * userId,RedirectAttributes ra) throws IllegalStateException, IOException {
	 * logger.debug("userId : {}", userId);
	 * 
	 * EmployeeVo selectEmpl = employeeService.selectEmployee(userId); return
	 * selectEmpl; }
	 * 
	 * @RequestMapping(path = "/updateEmployee_POST", method =
	 * RequestMethod.POST) public String updateEmployee_POST(EmployeeVo
	 * vo,RedirectAttributes ra) { logger.debug("수정 서블릿 : {}" ,vo);
	 * 
	 * 
	 * 
	 * employeeService.updateEmployee(vo);
	 * 
	 * ra.addFlashAttribute("msg", "정상 수정 되었습니다"); return
	 * "redirect:/employee/getAllEmployee"; }
	 * 
	 * 
	 * @RequestMapping(path = "/SearchEmployee", method = RequestMethod.GET)
	 * public String SearchEmployee(Model model, String searchName) {
	 * 
	 * 
	 * List<EmployeeVo> allEmployee =
	 * employeeService.SearchEmployee(searchName);
	 * model.addAttribute("allEmployee",allEmployee);
	 * 
	 * return "employeeListTiles"; }
	 */

}
