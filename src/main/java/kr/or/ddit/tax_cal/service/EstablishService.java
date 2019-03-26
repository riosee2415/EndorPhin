package kr.or.ddit.tax_cal.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.IEstablishDao;
import kr.or.ddit.tax_cal.model.EstablishVo;

@Service("establishService")
public class EstablishService implements IEstablishService{

	@Resource(name="establishDao")
	IEstablishDao establishDao;

	@Override
	public int insertEstablish(EstablishVo establishVo) {
		return establishDao.insertEstablish(establishVo);
	}

	@Override
	public int deleteEstablish(String establishcode) {
		return establishDao.deleteEstablish(establishcode);
	}

	@Override
	public List<EstablishVo> getAllEstablish() {
		return establishDao.getAllEstablish();
	}

	@Override
	public EstablishVo selectEstablish(String establishcode) {
		return establishDao.selectEstablish(establishcode);
	}

	@Override
	public List<EstablishVo> selectEstablishByNm(String establishNameKor) {
		return establishDao.selectEstablishByNm(establishNameKor);
	}
}
