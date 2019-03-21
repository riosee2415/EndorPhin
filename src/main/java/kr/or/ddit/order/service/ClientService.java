package kr.or.ddit.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;

@Service("clientService")
public class ClientService implements ICilentService{

	@Resource(name="clientDao")
	private IClientDao clientDao;
	
	
	/**
	* Method : getAllClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 정보를 전부 조회한다.
	*/
	@Override
	public List<ClientVo> getAllClient() {
		
		return clientDao.getAllClient();
	}


	@Override
	public List<ClientVo> getCodeClient(String clientCode) {
		
		return clientDao.getCodeClient(clientCode);
	}


	@Override
	public List<ClientVo> getNameClient(String clientName) {
		
		return clientDao.getNameClient(clientName);
	}

}
