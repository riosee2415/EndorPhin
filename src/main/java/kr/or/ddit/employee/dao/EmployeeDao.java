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
	public List<EmployeeVo> getAllEmployee() {
		return sqlSessionTemplate.selectList("employee.getAllEmployee");
	}

	@Override
	public EmployeeVo selectEmployee(String user) {
		return sqlSessionTemplate.selectOne("employee.selectEmployee", user);
	}

	@Override
	public int insertEmployee(EmployeeVo vo) {
		return sqlSessionTemplate.insert("employee.insertEmployee", vo);
	}

	@Override
	public int deleteEmployee(String userId) {
		return sqlSessionTemplate.delete("employee.deleteEmployee", userId);
	}
	


}
