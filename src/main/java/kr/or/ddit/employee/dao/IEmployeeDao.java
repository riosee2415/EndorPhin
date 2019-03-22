package kr.or.ddit.employee.dao;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeDao {
	public EmployeeVo selectEmployee(String userId);
	int insertEmployee(EmployeeVo employeeVo);
	int deleteEmployee(String userId);
	List<EmployeeVo> getAllEmployee();
}
