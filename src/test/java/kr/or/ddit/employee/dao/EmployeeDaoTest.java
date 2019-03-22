package kr.or.ddit.employee.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.set.LogicConfig;

public class EmployeeDaoTest extends LogicConfig{

	@Resource(name="employeeDao")
	private IEmployeeDao dao;
	
	@Test
	public void SelectEmployeetest() {
		EmployeeVo selectEmployee = dao.selectEmployee("1");
		
		assertNotNull(selectEmployee);
	}
	
	@Test
	public void SelectAllEmployee() {
		
		
	EmployeeVo selectEmployee = dao.selectEmployee("1");
		assertNotNull(selectEmployee);
		System.out.println(selectEmployee);
	}
	

}
