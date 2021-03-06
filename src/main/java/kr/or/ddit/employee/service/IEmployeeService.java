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
	* Method : selectUserByNm
	* 작성자 : PC04
	* 변경이력 :
	* @param usernm
	* @return
	* Method 설명 : 사원이름으로 검색
	*/
	List<EmployeeVo> selectUserByNm(String usernm);

	
	
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
	List<EmployeeVo> SearchEmployee(EmployeeVo userNm);
	
	/**
	* Method : selectMoreEmployee
	* 작성자 : pc05
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 입력받은 직책보다 높은 직책 출력
	*/
	List<EmployeeVo>  selectMoreEmployee(String positionCode);
	
}