package kr.or.ddit.employee.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.employee.model.EmployeeVo;

@Repository("employeeDao")
public class EmployeeDao implements IEmployeeDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public EmployeeVo selectEmployee(String userId) {
		EmployeeVo employeeVo = sqlSessionTemplate.selectOne("employee.selectEmployee",userId);
		return employeeVo;
	}

	@Override
	public int insertEmployee(EmployeeVo employeeVo) {
		int insert = sqlSessionTemplate.insert("employee.insertEmployee",employeeVo);
		return insert;
	}

	@Override
	public int deleteEmployee(String userId) {
		int delete = sqlSessionTemplate.delete("employee.deleteEmployee",userId);
		return delete;
	}

	@Override
	public List<EmployeeVo> getAllEmployee() {
		List<EmployeeVo> selectList = sqlSessionTemplate.selectList("employee.getAllEmployee");
		return selectList;
	}

}
