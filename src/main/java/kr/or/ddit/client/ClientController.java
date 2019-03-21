package kr.or.ddit.client;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;

@RequestMapping()
@Controller()
public class ClientController {
	
	@Resource(name="clientDao")
	private IClientDao clientDao;
	
	/**
	* Method : clientView
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 데이터를 전부 불러온다.
	*/
	@RequestMapping(path="/clientview", method=RequestMethod.GET)
	public String clientView(Model model) {
		
		List<ClientVo> clientList = clientDao.getAllClient();
		model.addAttribute("clientList", clientList);
			
		return "clientview";
	}

}
