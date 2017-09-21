/**
 * 操作的LOG記錄
 * descript: 行為描述
 * saveParam: 是否儲存傳入參數
 * saveResult: 是否儲存回傳結果
 */
package et.template.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER, ElementType.METHOD})  
@Retention(RetentionPolicy.RUNTIME)  
@Documented
public @interface SystemLog {
	String description() default "";
	boolean saveParam() default true;
	boolean saveResult() default true;
}
