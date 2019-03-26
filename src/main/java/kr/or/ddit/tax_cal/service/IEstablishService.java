package kr.or.ddit.tax_cal.service;

import java.util.List;

import kr.or.ddit.tax_cal.model.EstablishVo;

public interface IEstablishService {
	int insertEstablish(EstablishVo establishVo);
	int deleteEstablish(String establishcode);
	List<EstablishVo> getAllEstablish();
	EstablishVo selectEstablish(String establishcode); 
	List<EstablishVo> selectEstablishByNm(String establishNameKor);
}
