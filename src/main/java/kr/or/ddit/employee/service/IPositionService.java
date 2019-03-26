package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.PositionVo;

public interface IPositionService {
	
	public PositionVo selectPosition(String code);
	int insertPosition(PositionVo Vo);
	int deletePosition(String code);
	List<PositionVo> getAllPosition();

}
