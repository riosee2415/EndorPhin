package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeService {
	
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 :
	*/
	List<EmployeeVo> getAllEmployee();
	
	
	
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param user
	* @return
	* Method 설명 :
	*/
	EmployeeVo selectEmployee(String user);

	
	
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 :
	*/
	int insertEmployee(EmployeeVo vo);
	
	
	
	/**
	* Method : updateEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 :
	*/
	int updateEmployee(EmployeeVo vo);
	
	
	
	/**
	* Method : deleteEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 :
	*/
	int deleteEmployee(String userId);
	
	
	
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param user
	* @return
	* Method 설명 : 사원 검색
	*/
	List<EmployeeVo> SearchEmployee(String userNm);
	
	
}