package kr.or.ddit.company.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.DeptVo;

@Repository("deptDao")
public class DeptDao implements IDeptDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertDept(DeptVo deptVo) {
		int insert = sqlSessionTemplate.insert("dept.insertDept",deptVo);
		return insert;
	}

	@Override
	public int deleteDept(String deptcode) {
		int delete = sqlSessionTemplate.delete("dept.deleteDept",deptcode);
		return delete;
	}

	@Override
	public List<DeptVo> getAllDept() {
		List<DeptVo> selectList = sqlSessionTemplate.selectList("dept.getAllDept");
		return selectList;
	}

	@Override
	public DeptVo selectDept(String deptcode) {
		DeptVo selectOne = sqlSessionTemplate.selectOne("dept.selectDept",deptcode);
		return selectOne;
	}

}
