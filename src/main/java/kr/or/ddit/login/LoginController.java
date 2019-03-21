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
		//����ڰ� ��û�� id�� �ش��ϴ� ���� ������ ���̽��� ����� ��
		EmployeeVo dbEmployeeVo = dao.selectEmployee(employeeVo.getUserId());
		//���� �α��� �� ���
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
		// tiles ������ ���� ���� 
		return "helloTiles";
	}
}
