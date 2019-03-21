package kr.or.ddit.company.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.company.dao.ICardsDao;
import kr.or.ddit.company.model.CardsVo;

@Service
public class CardsService implements ICardsService{

	@Resource(name="cardsDao")
	private ICardsDao cardsDao;
	
	public CardsService() {
	
	}
	@Override
	public List<CardsVo> getAllCards() {
		return cardsDao.getAllCards();
	}

	@Override
	public CardsVo selectCards(Map<String, String> map) {
		return cardsDao.selectCards(map);
	}

	@Override
	public int insertCards(Map<String, String> map) {
		return cardsDao.insertCards(map);
	}

	@Override
	public int updateCards(CardsVo cardVo) {
		return cardsDao.updateCards(cardVo);
	}

	@Override
	public int deleteCards(Map<String, String> map) {
		return cardsDao.deleteCards(map);
	}


}
