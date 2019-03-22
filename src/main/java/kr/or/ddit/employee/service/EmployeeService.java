package kr.or.ddit.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;


@Service("employeeService")
public class EmployeeService implements IEmployeeService{
	
	@Resource(name="employeeDao")
	private IEmployeeDao employeeDao;

	@Override
	public List<EmployeeVo> getAllEmployee() {
		return employeeDao.getAllEmployee();
		
	}

	@Override
	public EmployeeVo selectEmployee(String user) {
		return employeeDao.selectEmployee(user);
	}

	@Override
	public int insertEmployee(EmployeeVo vo) {
		return employeeDao.insertEmployee(vo);
	}

	@Override
	public int deleteEmployee(String userId) {
		return employeeDao.deleteEmployee(userId);
	}
	
}