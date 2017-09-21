package et.template.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
    @Autowired
    private CustomAuthenticationProvider authProvider;
	
	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider);
/*		
		// Test 1
		auth //Builder Design Pattern
		.userDetailsService(userService); //換成userDetailsService
		
		
		// Test 2
		auth.inMemoryAuthentication()
			.withUser("bill").password("abc123").roles("USER");

		// Test 3
		auth //Builder Design Pattern
		.inMemoryAuthentication() //自訂Runtime時的使用者帳號
			.withUser("admin") //新增user
			.password("admin12345") //指定密碼
			.roles("ADMIN", "USER") //指派權限群組
			.and() //再新增使用者
			.withUser("user")
			.password("user12345")
			.roles("USER");
				
		// Test 4
		auth
			.jdbcAuthentication()
			.dataSource(localDB)
			.usersByUsernameQuery("select id, password, status from test.user where id = ?")
			.authoritiesByUsernameQuery("select id, 'ROLE_USER' from test.user where id = ?");
*/		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http.anonymous(); //任何人都可以存取網頁
		
		
		http.
		authorizeRequests()
			.antMatchers("/theme/**", "/login.jsp", "/register.jsp").permitAll()
			.antMatchers("/**").access("hasRole('USER')") //對象為所有網址
			.anyRequest()
			.authenticated() //存取必須通過驗證
		.and()
		.formLogin() //若未不符合authorize條件
			.loginPage("/login") //則產生login表單
			.usernameParameter("username").passwordParameter("password")
			.failureUrl("/login?error") //如果認證失敗，則導往/login並帶參數error
			.defaultSuccessUrl("/index") //認證通過後導往的Url
		.and()
		//.httpBasic(); //產生基本表單
		.logout()
			.logoutSuccessUrl("/login?logout")
			.permitAll()
		.and()
		.sessionManagement().maximumSessions(1);
		//.and().exceptionHandling().accessDeniedPage("/Access_Denied");
				
	}
}