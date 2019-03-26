package kr.or.ddit.company.dao;

import java.util.List;

import kr.or.ddit.company.model.DeptVo;

public interface IDeptDao {
	int insertDept(DeptVo deptVo);
	int deleteDept(String deptcode);
	List<DeptVo> getAllDept();
	DeptVo selectDept(String deptcode);
	   
}
