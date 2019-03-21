package kr.or.ddit.set;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"classpath:kr/or/ddit/config/spring/servlet-context.xml",
		 "classpath:kr/or/ddit/config/spring/application-context.xml"	
		})
@WebAppConfiguration	//������ �����̳ʸ� ���� �� WebApplicationContext�� ����
						// ������� applicationContext
public class WebConfig {
	@Autowired
	private WebApplicationContext context;
	protected MockMvc mockMvc;

	//@BeforeClass(static --> ��� �󵵰� ������)
	// @Before - @Test - @After
	// @Before - @Test - @After
	// ..........
	//@AfterClass
	
	@Before
	public void setUp(){
		mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
	}
}
