package et.template.service;

import et.template.model.User;

public interface LoginValidateService {

	public User validateUser(String userName, String password);
	

}
