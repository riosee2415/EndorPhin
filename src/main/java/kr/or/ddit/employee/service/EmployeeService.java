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
		List<EmployeeVo> allEmployee = employeeDao.getAllEmployee();
		return allEmployee;
		
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

	@Override
	public int updateEmployee(EmployeeVo vo) {
		return employeeDao.updateEmployee(vo);
	}

	@Override
	public List<EmployeeVo> SearchEmployee(String userNm) {
		return employeeDao.SearchEmployee(userNm);
		
	}
	
}