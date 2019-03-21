package kr.or.ddit.employee.dao;

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

}
