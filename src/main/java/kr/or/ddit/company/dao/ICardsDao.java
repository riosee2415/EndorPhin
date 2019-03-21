package kr.or.ddit.company.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CardsVo;

@Repository("cardsDao")
public interface ICardsDao {
	
	List<CardsVo> getAllCards();
	
	CardsVo selectCards(Map<String,String> map);
	
	int insertCards(Map<String,String> map);
	
	int updateCards(CardsVo cardVo);
	
	int deleteCards(Map<String, String> map);
	
}
