package kr.or.ddit.clinet.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.set.LogicConfig;

public class ClientDaoTest extends LogicConfig{
	
	private Logger logger = LoggerFactory.getLogger(ClientDaoTest.class);
	
	@Resource(name="clientDao")
	private IClientDao clientDao;

	
	
	@Test
	public void getClientTest() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getAllClient();
		logger.debug("clientList size : {}", clientList.size());

		/***Then***/
		assertEquals(1, clientList.size());
		
	}
	
	@Test
	public void getCodeClient() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getCodeClient("1");
		logger.debug("clientList size : {}", clientList.size());
		
		/***Then***/
		assertNotNull(clientList);
	}
	
	
	@Test
	public void getNameClient() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getNameClient("청");
		logger.debug("clientList size : {}", clientList.size());
		
		/***Then***/
		assertNotNull(clientList);
	}

}
