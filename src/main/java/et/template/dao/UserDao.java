package et.template.dao;

import java.util.List;

import et.template.annotation.DataSource;
import et.template.config.DataSourceContextHolder;
import et.template.model.User;

public interface UserDao {

	@DataSource(DataSourceContextHolder.TEST_DB)
	User findUser(String userName);

	@DataSource(DataSourceContextHolder.TEST_DB)
	List<User> findAllUsers();
	
	Integer insertUser(User user);
	
		
}
