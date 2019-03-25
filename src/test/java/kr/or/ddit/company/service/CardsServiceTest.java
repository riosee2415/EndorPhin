package kr.or.ddit.company.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.sun.javafx.collections.MappingChange.Map;

import kr.or.ddit.company.model.CardsVo;
import kr.or.ddit.set.LogicConfig;

public class CardsServiceTest extends LogicConfig {

	@Resource(name = "cardsService")
	private ICardsService cardsService;

	@Test
	public void getAllcompanyTest() {
		List<CardsVo> cardsList = cardsService.getAllCards();
		assertEquals(1, cardsList.size());
	}

	@Test
	public void serachCardsTest() {
	    CardsVo cardsVo = new CardsVo();
	    cardsVo.setCardCode("1");
	    cardsVo.setCardName("농협카드");
	    cardsVo.setCardNumber("123412341234");
	    cardsVo.setCardSortation("1");
	    cardsVo.setCompanyCode("1");
	    cardsVo.setMemo("55");
	    cardsVo.setStatus("1");
		
		List<CardsVo> cardsList = cardsService.serachCards(cardsVo);
	}

}
