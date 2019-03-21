package kr.or.ddit.employee.dao;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeDao {
	public EmployeeVo selectEmployee(String userId);
}
