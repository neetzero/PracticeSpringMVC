package et.template.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	private ServletContext context;
	
	static final String[] NO_FILTER_PAGE = {"/theme/", "login", "register", "doLogin", "sample.jsp"};
	
	public void destroy() {
		
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// user請求的頁面
		String path = servletRequest.getRequestURI();
		//System.out.println(path);

		// 從session裡取登入資訊
		Object loginUser = session.getAttribute("LoginUser");
		
		//不需過濾的頁面
		for (int i = 0; i < NO_FILTER_PAGE.length; i++) {
			if (path.indexOf(NO_FILTER_PAGE[i]) > -1) {
				chain.doFilter(servletRequest, servletResponse);
				return;
			}
		}
		
		//context path也不用過濾
		if(path.equals(context.getContextPath()+"/")){
			chain.doFilter(request, response);
			return;
		}
		
		// 如果沒有登入資訊，就跳轉登入頁面
		if (loginUser == null) {
			servletResponse.sendRedirect(context.getContextPath()+"/login");
		} else {
			// 已登入繼續執行
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig config) throws ServletException {
		context = config.getServletContext();
	}

}
