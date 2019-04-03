package kr.or.ddit.annual.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.annual.model.AnnualVo;
import kr.or.ddit.set.LogicConfig;

public class AnnualTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(AnnualTest.class);

	
	
	@Resource(name = "annualService")
	private IAnnualService annualService;
	
	
	@Test
	public void allAnnualTest() {
		
		List<AnnualVo> allAnnuals = annualService.getAllAnnual();
		for(AnnualVo allAnnual : allAnnuals){
			logger.debug("치약 :{}",allAnnual);
		}
		
	}
	
	

	
	
	
}
