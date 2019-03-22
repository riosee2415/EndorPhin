package kr.or.ddit.order.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.order.model.ClientVo;

@Repository("clientDao")
public class ClientDao implements IClientDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	/**
	* Method : getAllClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 정보를 전부 조회한다.
	*/
	@Override
	public List<ClientVo> getAllClient() {
		List<ClientVo> clientList = sqlSessionTemplate.selectList("client.getAllClient");
		System.out.println(clientList.size());
		return clientList;
	}

	
	/**
	* Method : getCodeClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientCode값을 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getCodeClient(String clientCode) {
		HashMap map = new HashMap();
		map.put("clientCode", clientCode);
		List<ClientVo> clinetList = sqlSessionTemplate.selectList("client.getCodeClient", map);
		
		return clinetList;
	}

	
	/**
	* Method : getCodeClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName값을 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getNameClient(String clientName) {
		HashMap map = new HashMap();
		map.put("clientName", clientName);
		List<ClientVo> clinetList = sqlSessionTemplate.selectList("client.getNameClient", map);
		
		return clinetList;
		
	}

	
	
	/**
	* Method : getBothClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName과 ClientCode를 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getBothClient(String clientName, String clientCode) {
		
		HashMap map = new HashMap();
		map.put("clientName", clientName);
		map.put("clientCode", clientCode);
		List<ClientVo> clinetList = sqlSessionTemplate.selectList("client.getBothClient", map);
		
		return clinetList;
	}


	/**
	* Method : insertClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param clientVo
	* @return
	* Method 설명 : 거래처 데이터 추가
	*/
	@Override
	public int insertClient(ClientVo clientVo) {
		int cnt = sqlSessionTemplate.insert("client.insertClient", clientVo);
		
		return cnt;
	}
}
