package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeService {
	public EmployeeVo selectEmployee(String userId);
	int insertEmployee(EmployeeVo employeeVo);
	int deleteEmployee(String userId);
	List<EmployeeVo> getAllEmployee();
}
