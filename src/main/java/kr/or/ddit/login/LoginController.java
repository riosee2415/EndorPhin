package kr.or.ddit.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;

@Controller
public class LoginController {

	@Resource(name="employeeDao")
	private IEmployeeDao dao;
	
	@RequestMapping(path="/login",method=RequestMethod.GET)
	public String login(){
		return "login";
		
	}
	
	@RequestMapping(path="/login",method=RequestMethod.POST)
	public String login_post(EmployeeVo employeeVo, HttpSession session){
		//사용자가 요청한 id에 해당하는 실제 데이터 베이스에 저장된 값
		EmployeeVo dbEmployeeVo = dao.selectEmployee(employeeVo.getUserId());
		//정상 로그인 한 경우
		if(dbEmployeeVo.getUserId().equals(employeeVo.getUserId())&&
				dbEmployeeVo.getPassword().equals(employeeVo.getPassword())){
			session.setAttribute("employeeVo", dbEmployeeVo);
			return "redirect:/helloTiles";
		}
		else
			return "login";
		
	}
	
	@RequestMapping(path="/helloTiles")
	public String helloTiles(){
		// tiles 적용을 위한 예제 
		return "helloTiles";
	}
}
