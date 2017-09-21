package et.template.utils;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import et.template.model.User;

public class UserAuthorityUtils {
	
	private static final List<GrantedAuthority> ADMIN_ROLES = AuthorityUtils.createAuthorityList("ADMIN", "USER");
	//利用Spring提供的AuthorityUtils中createAuthorityList將該群組加入相關roles
	//以便用一個List變數就儲存所有roles
	private static final List<GrantedAuthority> USER_ROLES = AuthorityUtils.createAuthorityList("USER");

	public static Collection<? extends GrantedAuthority> createAuthorities(User user) {
		String username = user.getUserName();
		
		System.out.println("Utils: " + username + " , " + user.getPassword());
//		if (username.contains("admin")) { //帳號中含有admin，即有管理者之role
//			return ADMIN_ROLES;
//		}
		return USER_ROLES; //否則則為一般使用者
	}
}
