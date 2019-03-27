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
		return sqlSessionTemplate.insert("dept.insertDept",deptVo);
	}

	@Override
	public int deleteDept(String deptcode) {
		return sqlSessionTemplate.delete("dept.deleteDept",deptcode);
	}

	@Override
	public List<DeptVo> getAllDept() {
		return sqlSessionTemplate.selectList("dept.getAllDept");
	}

	@Override
	public DeptVo selectDept(String deptcode) {
		return sqlSessionTemplate.selectOne("dept.selectDept",deptcode);
	}

	@Override
	public int updateDept(DeptVo deptVo) {
		return sqlSessionTemplate.update("dept.updateDept",deptVo);
	}

}
