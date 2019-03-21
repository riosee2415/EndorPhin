package kr.or.ddit.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	
	@RequestMapping(path="/helloTiles")
	public String helloTiles(){
		// tiles 적용을 위한 예제 
		return "helloTiles";
	}
}
