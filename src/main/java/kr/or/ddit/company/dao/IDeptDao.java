package kr.or.ddit.company.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.DeptVo;

@Repository("deptDao")
public interface IDeptDao {
	
	int insertDept(DeptVo deptVo);
	
	int deleteDept(String deptcode);
	
	List<DeptVo> getAllDept();
	
	DeptVo selectDept(String deptcode);
	
	int updateDept(DeptVo deptVo);
	   
}
