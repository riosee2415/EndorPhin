package kr.or.ddit.employee.dao;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;

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
	public void getAllEmployeeTest() {
		dao.getAllEmployee();
	}
	@Test
	public void insertEmployeeTest() throws ParseException {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("5");
		employeeVo.setUserNm("硫띿껌�씠");
		employeeVo.setBirthDate("19190101");
		dao.insertEmployee(employeeVo);
	}
	@Test
	public void deleteEmployeeTest() {
		dao.deleteEmployee("5");
	}
}
