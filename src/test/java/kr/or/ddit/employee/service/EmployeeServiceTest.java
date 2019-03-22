package kr.or.ddit.employee.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.set.LogicConfig;

public class EmployeeServiceTest extends LogicConfig{

	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@Test
	public void selectEmployeeTest() {
		EmployeeVo selectEmployee = employeeService.selectEmployee("1");
		assertEquals("이준호", selectEmployee.getUserNm());
	}
	@Test
	public void insertEmployeeTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("5");
		employeeVo.setUserNm("멍청이");
		employeeVo.setBirthDate("19190101");
		int insertEmployee = employeeService.insertEmployee(employeeVo);
		assertEquals(1, insertEmployee);
	}
	@Test
	public void deleteEmployeeTest() {
		int deleteEmployee = employeeService.deleteEmployee("5");
		assertEquals(1, deleteEmployee);
	}
	@Test
	public void getAllEmployeeTest() {
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		assertTrue(allEmployee.size()>0);
	}

}
