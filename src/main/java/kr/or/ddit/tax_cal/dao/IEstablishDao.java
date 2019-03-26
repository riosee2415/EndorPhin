package kr.or.ddit.tax_cal.dao;

import java.util.List;

import kr.or.ddit.tax_cal.model.EstablishVo;

public interface IEstablishDao {
	int insertEstablish(EstablishVo establishVo);
	int deleteEstablish(String establishcode);
	List<EstablishVo> getAllEstablish();
	List<EstablishVo> selectEstablishByNm(String establishNameKor);
	EstablishVo selectEstablish(String establishcode); 
}
