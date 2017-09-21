package et.template.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ApplicationContextHelper implements ApplicationContextAware {
	
	private static ApplicationContext applicationContext = null;
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		ApplicationContextHelper.applicationContext = applicationContext;
	}

	public static Object getBean(String beanName) {
		return applicationContext.getBean(beanName);
	}
	
}
