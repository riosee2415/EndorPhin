package kr.or.ddit.employee.dao;

import java.util.List;

import kr.or.ddit.employee.model.PositionVo;

public interface IPositionDao {
	
	public PositionVo selectPosition(String code);
	int insertPosition(PositionVo Vo);
	int deletePosition(String code);
	List<PositionVo> getAllPosition();

}
