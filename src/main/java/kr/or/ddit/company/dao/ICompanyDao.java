package kr.or.ddit.company.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.company.model.CompanyVo;

public interface ICompanyDao {
	
	List<CompanyVo> getAllcompany();
	CompanyVo selectCompany(String companycode);
	int insertCompany(CompanyVo companyVo);
	int deleteCompany(String companycode);
}
