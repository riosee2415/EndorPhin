package kr.or.ddit.company.service;

import java.util.List;

import kr.or.ddit.company.model.CompanyVo;

public interface ICompanyService {
	List<CompanyVo> getAllcompany();
	CompanyVo selectCompany(String companycode);
	int insertCompany(CompanyVo companyVo);
	int deleteCompany(String companycode);
}
