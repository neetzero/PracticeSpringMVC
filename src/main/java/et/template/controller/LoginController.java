package et.template.controller;

import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import et.template.annotation.SystemLog;
import et.template.exception.LoginException;
import et.template.model.User;
import et.template.service.LoginValidateService;


@Controller
public class LoginController {
	
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
    private MessageSource messageSource;
	   
	@Autowired
	private LoginValidateService loginValidateService;
	
	@RequestMapping(value = {"/","/login"}, method=RequestMethod.GET)
	public ModelAndView login() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("login");
		return model;
	}
	
	@RequestMapping(value="/doLogin", method=RequestMethod.POST)
	@SystemLog(description = "登入", saveParam = false, saveResult = false)
	public ModelAndView doLogin(@RequestParam(value="username",required = true) String username,
						@RequestParam(value="password",required = true) String psd) {
		
		ModelAndView mv = new ModelAndView();
		
		username = StringUtils.trim(username);
		psd = StringUtils.trim(psd);
		
		//登入驗證
		User loginUser = loginValidateService.validateUser(username, psd);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();
		session.setAttribute("LoginUser", loginUser); 
		
		//通過
		if(loginUser != null){
			
			log.debug("loginUser : {}", loginUser);
			
			mv.addObject("LoginUser", loginUser);
//			if(loginUser.getStatus() == null || StringUtils.isBlank(loginUser.getStatus())){
//				mv.setViewName("redirect:index");
//			}else{
//				mv.setViewName("redirect:operator/changePassword");
//			}
			
		}else{
			String errCode = LoginException.LOGIN_ERROR;
			String errMsg = messageSource.getMessage("LOGIN.MESSAGE."+errCode, null, LocaleContextHolder.getLocale());
			//throw new LoginException(errCode, errMsg);
			throw new LoginException(errMsg);
		}
		
		
        Enumeration<String> attrs = session.getAttributeNames();
        System.out.println("start session name loop");
        while(attrs.hasMoreElements()){
        	String key = attrs.nextElement();
        	System.out.println(key + " : " + session.getAttribute(key));
        }
        
		return mv;
	}
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		HashMap<String, String> map = new HashMap<String,String>();
		//map.put("userName", username);
		//map.put("userPass", userpass);
		//map.put("pagename", pagename);
		
		mav.addObject("loginBody", map);
		return mav;
	}
	
	
	@RequestMapping(value="logout", method=RequestMethod.POST)
	@SystemLog(description = "登出")
	public String doLogout(HttpSession session, SessionStatus status) {
		
		session.removeAttribute("LoginUser");
		session.invalidate();
		status.setComplete();
		return "redirect:login";
	}
}
