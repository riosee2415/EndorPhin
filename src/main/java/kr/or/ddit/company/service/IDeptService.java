package kr.or.ddit.company.service;

import java.util.List;

import kr.or.ddit.company.model.DeptVo;

public interface IDeptService {

	int insertDept(DeptVo deptVo);
	
	int deleteDept(String deptcode);
	
	List<DeptVo> getAllDept();
	
	DeptVo selectDept(String deptcode);
	
	int updateDept(DeptVo deptVo);
}
