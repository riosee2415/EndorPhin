package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;

public interface IEmployeeService {
	
	//�����ü ��������
	List<EmployeeVo> getAllEmployee();
	
	//��� �����Ͽ� ��������
	EmployeeVo selectEmployee(String user);

	//��� ���
	int insertEmployee(EmployeeVo vo);
	
	
	//��� ����
	int deleteEmployee(String userId);
	
	
}