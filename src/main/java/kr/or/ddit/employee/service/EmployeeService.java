package kr.or.ddit.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;

@Service
public class EmployeeService implements IEmployeeService{

	@Resource(name="employeeDao")
	IEmployeeDao employeeDao;
	
	@Override
	public EmployeeVo selectEmployee(String userId) {
		EmployeeVo selectEmployee = employeeDao.selectEmployee(userId);
		return selectEmployee;
	}

	@Override
	public int insertEmployee(EmployeeVo employeeVo) {
		int insertEmployee = employeeDao.insertEmployee(employeeVo);
		return insertEmployee;
	}

	@Override
	public int deleteEmployee(String userId) {
		int deleteEmployee = employeeDao.deleteEmployee(userId);
		return deleteEmployee;
	}

	@Override
	public List<EmployeeVo> getAllEmployee() {
		List<EmployeeVo> allEmployee = employeeDao.getAllEmployee();
		return allEmployee;
	}

}
