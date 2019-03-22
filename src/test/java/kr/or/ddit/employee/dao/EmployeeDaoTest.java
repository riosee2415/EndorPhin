package kr.or.ddit.employee.dao;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.set.LogicConfig;

public class EmployeeDaoTest extends LogicConfig{
private Logger logger = LoggerFactory.getLogger(EmployeeDaoTest.class);
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
		employeeVo.setUserId("100");
		employeeVo.setUserNm("송중기");
		
		
		dao.insertEmployee(employeeVo);
	}
	@Test
	public void deleteEmployeeTest() {
		
		/***Given***/
		
		/***When***/

		/***Then***/

		dao.deleteEmployee("5");
	}
}
