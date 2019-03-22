package kr.or.ddit.company.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CardsVo;

@Repository("cardsDao")
public class CardsDao implements ICardsDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CardsVo> getAllCards() {
		return sqlSessionTemplate.selectList("cards.getAllCards");
	}

	@Override
	public CardsVo selectCards(String cardCode) {
		return sqlSessionTemplate.selectOne("cards.selectCards", cardCode);
	}

	@Override
	public int insertCards(CardsVo cardVo) {
		return sqlSessionTemplate.insert("cards.insertCards", cardVo);
	}

	@Override
	public int updateCards(CardsVo cardVo) {
		return sqlSessionTemplate.update("cards.updateCards", cardVo);
	}

	@Override
	public int deleteCards(String cardCode) {
		return sqlSessionTemplate.delete("cards.deleteCards", cardCode);
	}

	@Override
	public List<CardsVo> serachCards(CardsVo cardVo) {
		return sqlSessionTemplate.selectList("cards.serachCards", cardVo);
	}
	
}
