package kr.or.ddit.company.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.company.model.CardsVo;

public interface ICardsService {
	
	List<CardsVo> getAllCards();
	
	CardsVo selectCards(Map<String,String> map);
	
	int insertCards(Map<String,String> map);
	
	int updateCards(CardsVo cardVo);
	
	int deleteCards(Map<String, String> map);
}
