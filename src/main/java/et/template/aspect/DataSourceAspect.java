package et.template.aspect;

import java.lang.reflect.Method;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Component;

import et.template.annotation.DataSource;
import et.template.config.DataSourceContextHolder;

@Aspect
@Component
public class DataSourceAspect implements MethodBeforeAdvice, AfterReturningAdvice {

	
	
	public void afterReturning(Object arg0, Method arg1, Object[] arg2, Object arg3) throws Throwable {
		DataSourceContextHolder.clearDataSource();
		
	}

	public void before(Method method, Object[] arg1, Object arg2) throws Throwable {
		if (method.isAnnotationPresent(DataSource.class)) {
			
			DataSource datasource = method.getAnnotation(DataSource.class);
			DataSourceContextHolder.setDataSource(datasource.value());
		} else {
			String datasource = DataSourceContextHolder.getDataSource();
			if(datasource == null || "".equals(datasource)){
				datasource = DataSourceContextHolder.LOCAL_DB;
			}
			DataSourceContextHolder.setDataSource(datasource);
		}
	}

}
