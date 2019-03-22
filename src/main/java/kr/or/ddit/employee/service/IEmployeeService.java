package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeService {
	
	//사원전체 가져오기
	List<EmployeeVo> getAllEmployee();
	
	//사원 선택하여 가져오기
	EmployeeVo selectEmployee(String user);

	//사원 등록
	int insertEmployee(EmployeeVo vo);
	
	
	//사원 삭제
	int deleteEmployee(String userId);
	
	
}