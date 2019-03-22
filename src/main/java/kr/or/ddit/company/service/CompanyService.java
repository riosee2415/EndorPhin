package kr.or.ddit.company.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.company.dao.ICompanyDao;
import kr.or.ddit.company.model.CompanyVo;

@Service("companyService")
public class CompanyService implements ICompanyService{

	@Resource(name="companyDao")
	ICompanyDao companyDao;
	
	@Override
	public List<CompanyVo> getAllcompany() {
		List<CompanyVo> allcompany = companyDao.getAllcompany();
		return allcompany;
	}

	@Override
	public CompanyVo selectCompany(String companycode) {
		CompanyVo selectCompany = companyDao.selectCompany(companycode);
		return selectCompany;
	}

	@Override
	public int insertCompany(CompanyVo companyVo) {
		int insertCompany = companyDao.insertCompany(companyVo);
		return insertCompany;
	}

	@Override
	public int deleteCompany(String companycode) {
		int deleteCompany = companyDao.deleteCompany(companycode);
		return deleteCompany;
	}

}
