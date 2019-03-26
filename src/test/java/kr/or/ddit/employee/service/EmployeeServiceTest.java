package kr.or.ddit.employee.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.set.LogicConfig;

public class EmployeeServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(EmployeeServiceTest.class);

	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@Resource(name = "employeeDetailService")
	private IEmployeeDetailService employeeDetailService;
	
	@Test
	public void selectEmployeeTest() {
		EmployeeVo selectEmployee = employeeService.selectEmployee("2");
		logger.debug("감자 : {}",selectEmployee);
	}
	@Test
	public void insertEmployeeTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("70");
		employeeVo.setUserNm("부서");
		employeeVo.setDeptCode("10");
		employeeVo.setPositionCode("1");
		employeeVo.setRankCode("1");
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
		logger.debug("보리차 : {}",allEmployee);
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
		int insertEmployee = employeeService.insertEmployee(employeeVo);
		
		Employee_detailVo detailVo = new Employee_detailVo();
		detailVo.setUserId("75");
		detailVo.setImg_name("1");
		detailVo.setImg_path("1");
		int insertEmployeeDetail = employeeDetailService.insertEmployeeDetail(detailVo);
		assertNotNull(insertEmployeeDetail);
		
	}
	
	@Test
	public void getAllEmployeeDetailImage() {
		Employee_detailVo selectEmployeeDetail = employeeDetailService.selectEmployeeDetail("1005");
		logger.debug("이미지 : {}", selectEmployeeDetail.getImg_path());
	}
	
	
	@Test
	public void getAllEmployeeDateTest() {
		 EmployeeVo selectEmployee = employeeService.selectEmployee("60");
		logger.debug("이미지 : {}", selectEmployee.getBirthDate());
	}
	
	

}
