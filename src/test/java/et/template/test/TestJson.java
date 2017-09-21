package et.template.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import et.template.exception.LoginException;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)		//表示繼承了SpringJUnit4ClassRunner
@ContextConfiguration(locations = {"/spring-mvc.xml","/spring-datasources.xml","/spring-aspect.xml"})
public class TestJson {
	private ObjectMapper mapper = null;

    @Autowired
    private MessageSource messageSource;
    
	@Before
	public void init() {
		mapper = new ObjectMapper();
	}
	
	@Value("${password.expired.days}")
	private String passwordExpiredLimit;
	
	@Test
	public void test(){
		String errCode = LoginException.ERR_NO_USER;
		String errMsg = messageSource.getMessage("LOGIN.MESSAGE."+errCode, null, LocaleContextHolder.getLocale());
	
		System.out.println(passwordExpiredLimit);
		LoginException exception = new LoginException(errMsg);
		
		try {
			byte[] jsonBytes = mapper.writeValueAsBytes(exception);
			String jsonString = mapper.writeValueAsString(exception);
			System.out.println(jsonBytes);
			System.out.println(jsonString);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@After
	public void destory() {
		mapper = null;
	}
}
