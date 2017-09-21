package et.template.service.impl;

import java.util.Calendar;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import et.template.controller.LoginController;
import et.template.dao.UserDao;
import et.template.exception.LoginException;
import et.template.model.User;
import et.template.service.LoginValidateService;
import et.template.utils.ToolUtil;


@Service
public class LoginValidateServiceImpl implements LoginValidateService {

	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private UserDao dao;

	@Value("${password.expired.days}")
	private String passwordExpiredLimit;

	public User validateUser(String userName, String password) throws LoginException {
		String errCode = "";
		String errMsg = "";
		try {
			User user = dao.findUser(userName);

			User loginUser = null;
			if (user != null) {
				String psd = user.getPassword();
				String psdMd5 = ToolUtil.MD5Message(password);
				if (psd.equals(password) || psd.equals(psdMd5)) {
					loginUser = new User();
					loginUser.setId(user.getId());
					loginUser.setUserName(user.getUserName());

					if (user.getPwdChange() != null) {
						// 檢查密碼有沒有過期
						long time = Calendar.getInstance().getTimeInMillis() - user.getPwdChange().getTime();
						long range = Long.valueOf(passwordExpiredLimit) * 86400000;
						log.debug("now time : {}, password change date : {}", time, range);
						// 密碼超過
						if (time > range) {
							//loginUser.setStatus(LoginException.ERR_PWD_EXPIRE);
						}
					}
					return loginUser;
				// 密碼錯誤
				} else {
					errCode = LoginException.ERR_VALIDATE_FAIL;
					errMsg = getErrMessage(errCode);
					//throw new LoginException(errCode, errMsg);
					throw new LoginException(errMsg);
				}
			// 無此使用者
			} else {
				errCode = LoginException.ERR_NO_USER;
				errMsg = getErrMessage(errCode);
				throw new LoginException(errMsg);
			}
		} catch (LoginException e) {
			if(errCode == null || StringUtils.isBlank(errCode)){
				errCode = LoginException.LOGIN_ERROR;
			}
			errMsg = getErrMessage(errCode);
			throw new LoginException(errMsg);
		}
	}

	private String getErrMessage(String code) {
		String message = "";
		message = messageSource.getMessage("LOGIN.MESSAGE." + code, null, LocaleContextHolder.getLocale());
		return message;
	}
}
