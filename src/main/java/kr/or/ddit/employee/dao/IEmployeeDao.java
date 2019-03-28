package kr.or.ddit.employee.dao;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeDao {
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 선택하여 가져오기
	*/
	public EmployeeVo selectEmployee(String userId);
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 신규등록
	*/
	int insertEmployee(EmployeeVo employeeVo);
	/**
	* Method : deleteEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 삭제
	*/
	int deleteEmployee(String userId);
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 사원 전체불러오기
	*/
	List<EmployeeVo> getAllEmployee();
	/**
	* Method : updateEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 업데이트
	*/
	int updateEmployee(EmployeeVo employeeVo);
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 검색
	*/
	public List<EmployeeVo> SearchEmployee(String userNm);
	
	
	
	
	
}
