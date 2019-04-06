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
	


	@Override
	public List<EmployeeVo> getAllEmployee() {
		List<EmployeeVo> selectList = sqlSessionTemplate.selectList("employee.getAllEmployee");
		return selectList;
	}

	@Override
	public int updateEmployee(EmployeeVo employeeVo) {
		return sqlSessionTemplate.update("employee.updateEmployee",employeeVo);
		
	}

	@Override
	public List<EmployeeVo> SearchEmployee(EmployeeVo userNm) {
		return sqlSessionTemplate.selectList("employee.SearchEmployee",userNm);
	}

	@Override
	public List<EmployeeVo> selectUserByNm(String usernm) {
		return sqlSessionTemplate.selectList("employee.selectUserByNm", usernm);
	}

}
