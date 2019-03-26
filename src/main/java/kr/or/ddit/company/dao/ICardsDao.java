package kr.or.ddit.company.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CardsVo;

@Repository("cardsDao")
public interface ICardsDao {
	
	List<CardsVo> getAllCards();
	
	CardsVo selectCards(String cardCode);
	
	List<CardsVo> serachCards(CardsVo cardVo);
	
	int insertCards(CardsVo cardVo);
	
	int updateCards(CardsVo cardVo);
	
	int upateStatusCards(CardsVo cardVo);

	int deleteCards(String cardCode);
	
}
