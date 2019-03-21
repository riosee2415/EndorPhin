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
	public CardsVo selectCards(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("cards.selectCards", map);
	}

	@Override
	public int insertCards(Map<String, String> map) {
		return sqlSessionTemplate.insert("cards.insertCards", map);
	}

	@Override
	public int updateCards(CardsVo cardVo) {
		return sqlSessionTemplate.update("cards.updateCards", cardVo);
	}

	@Override
	public int deleteCards(Map<String, String> map) {
		return sqlSessionTemplate.delete("cards.deleteCards", map);
	}
	
	
}
