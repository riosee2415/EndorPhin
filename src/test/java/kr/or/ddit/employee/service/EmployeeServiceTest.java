package kr.or.ddit.employee.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.set.LogicConfig;

public class EmployeeServiceTest extends LogicConfig{

	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@Resource(name = "employeeDetailService")
	private IEmployeeDetailService employeeDetailService;
	
	@Test
	public void selectEmployeeTest() {
		EmployeeVo selectEmployee = employeeService.selectEmployee("1");
		assertEquals("이준호", selectEmployee.getUserNm());
	}
	@Test
	public void insertEmployeeTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("70");
		employeeVo.setUserNm("부서");
		employeeVo.setDeptCode("10");
		employeeVo.setPositionCode("1");
		employeeVo.setRankCode("1");
		employeeVo.setBirthDate("20180909");
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
	
	@Test
	public void getAllEmployeeDetailTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("75");
		employeeVo.setUserNm("부서");
		employeeVo.setDeptCode("10");
		employeeVo.setPositionCode("1");
		employeeVo.setRankCode("1");
		employeeVo.setBirthDate("20180909");
		int insertEmployee = employeeService.insertEmployee(employeeVo);
		
		Employee_detailVo detailVo = new Employee_detailVo();
		detailVo.setUserId("75");
		detailVo.setImg_name("1");
		detailVo.setImg_path("1");
		int insertEmployeeDetail = employeeDetailService.insertEmployeeDetail(detailVo);
		assertNotNull(insertEmployeeDetail);
		
	}
	
	

}
