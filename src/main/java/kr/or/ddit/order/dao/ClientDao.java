package kr.or.ddit.order.dao;

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

}
