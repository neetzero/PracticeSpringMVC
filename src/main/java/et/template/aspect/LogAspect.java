package et.template.aspect;

import java.lang.reflect.Method;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import et.template.annotation.SystemLog;
import et.template.dao.OperateRecordDao;
import et.template.model.OperateRecord;
import et.template.model.User;


@Aspect
@Component
public class LogAspect {

	@Autowired
	OperateRecordDao dao;
	
	private static ObjectMapper mapper = new ObjectMapper();
	private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);
	
	
	public LogAspect(){
		//constructor
		//mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
	}
	
    @Pointcut("@annotation(et.template.annotation.SystemLog)")  
    public void logAspect() {
    }
    
    /**
     * 前置通知 用於攔截Controller記錄user操作 
     * @param joinPoint 切点 
     */  
//    @Before("logAspect()")  
//    public void doBefore(JoinPoint joinPoint) {  
//        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
//        HttpSession session = request.getSession();  
//        //Session中的user  
//        LoginUserModel user = (LoginUserModel) session.getAttribute("LoginUser");
//        String userAccount = "";
//        if(user!=null){
//        	userAccount = user.getAccount();
//        }
//        //IP  
//        String ip = request.getRemoteAddr();  
//        try {  
//            //*========Console 輸出=========*//  
//            System.out.println("=====前置通知開始 doBefore=====");  
//            System.out.println("請求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//            System.out.println("方法描述:" + getMethodDescription(joinPoint));  
//            System.out.println("請求人:" + userAccount);  
//            System.out.println("請求IP:" + ip);  
//            //*========DB Log=========*//
//            Log log = SpringContextHolder.getBean("logxx");  
//            log.setDescription(getMethodDescription(joinPoint));  
//            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//            log.setType("0");  
//            log.setRequestIp(ip);  
//            log.setExceptionCode(null);  
//            log.setExceptionDetail(null);  
//            log.setParams(null);  
//            log.setCreateBy(user);  
//            //insert資料庫
//            logService.add(log);  
//            System.out.println("=====前置通知結束=====");  
//        } catch (Exception e) {  
//            //logger
//            logger.error("==前置通知異常==");  
//            logger.error("異常訊息:{}", e.getMessage());
//            e.printStackTrace();
//        }  
//    }
    
    /** 
     * 回傳後通知
     * 
     * @param joinPoint 
     * @param e 
     */  
    @AfterReturning(pointcut = "logAspect()", returning="rtn")  
    public void doAfterReturning(JoinPoint joinPoint, Object rtn) {  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //user  
        User user = (User) session.getAttribute("LoginUser");
        if(user==null){
        	user = new User();
        	user.setUserName("");
        	user.setId(0);
        }
        //ip  
        String ip = request.getRemoteAddr();  
        //request方法參數並轉為json  
        String params = "";
        String result = "";
//        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
//            for (int i = 0; i < joinPoint.getArgs().length; i++) {  
//                //params += JSONUtil.toJsonString(joinPoint.getArgs()[i]) + ";";
//            	params += joinPoint.getArgs()[i] + ";";
//            	System.out.println("i : " + joinPoint.getArgs()[i] + " : " + joinPoint.getArgs()[i].getClass().getName());
//            }  
//        }
        
        try {
        	//System.out.println("rtn : " + mapper.writeValueAsString(rtn)); //回傳值
        	//System.out.println("arg : " + mapper.writeValueAsString(joinPoint.getArgs())); //傳入參數
        	
        	if(isSaveParams(joinPoint)){
        		params = mapper.writeValueAsString(joinPoint.getArgs());
        	}
        	if(isSaveResult(joinPoint)){
        		result = mapper.writeValueAsString(rtn);
        	}
        	
            /*========Console Out=========*/
            System.out.println("=====通知開始 doAfterReturning=====");  
            //System.out.println("className:" + rtn.getClass().getName());  
            //System.out.println("訊息:" + rtn.getMessage());  
            System.out.println("方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            System.out.println("方法描述:" + getMethodDescription(joinPoint));  
            System.out.println("請求人:" + user.getUserName());  
            System.out.println("請求IP:" + ip);  
            System.out.println("請求參數:" + params);
            System.out.println("回傳值:" + result);

            /*==========DB Log=========*/  
            OperateRecord record = new OperateRecord();
            record.setController(joinPoint.getTarget().getClass().getName().replaceAll("et.template.", "")); //去掉前綴
            record.setMethod(joinPoint.getSignature().getName());
            record.setUserId(user.getId());
            record.setDescription(getMethodDescription(joinPoint));  
            record.setStatus(true);
            record.setParameter(params);
            record.setResult(result);
            //insert
            dao.insertRecord(record);  
            System.out.println("=====回傳通知結束=====");  
        } catch (Exception ex) {  
            //記錄Log  
            logger.error("==回傳通知異常==");  
            logger.error("異常訊息:{}", ex.getMessage());  
        }  
         /*==========logger==========*/  
        //logger.error("異常方法:{}異常代碼:{}參數:{}", joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(), rtn.getClass().getName(), params);  
  
    }  
  
    /** 
     * 異常通知 用於攔截service層記錄異常 
     * 
     * @param joinPoint 
     * @param e 
     */  
    @AfterThrowing(pointcut = "logAspect()", throwing = "e")  
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //user  
        User user = (User) session.getAttribute("LoginUser");
        System.out.println(user);
        if(user==null){
        	user = new User();
        	user.setUserName("");
        	user.setId(0);
        }
        //ip  
        String ip = request.getRemoteAddr();  
        //request方法參數並轉為json  
        String params = "";
        try {
        	//if(isSaveParams(joinPoint)){
    		params = mapper.writeValueAsString(joinPoint.getArgs()); //Exception一律記錄傳入參數
        	//}
            /*========Console Out=========*/  
            System.out.println("=====異常通知開始 doAfterThrowing=====");  
            System.out.println("異常代碼:" + e.getClass().getName());  
            System.out.println("異常訊息:" + e.getMessage());  
            System.out.println("異常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
            System.out.println("方法描述:" + getMethodDescription(joinPoint));  
            System.out.println("請求人:" + user.getUserName());  
            System.out.println("請求IP:" + ip);  
            System.out.println("請求參數:" + params);  
            /*==========DB Log=========*/  
            OperateRecord record = new OperateRecord();
            record.setController(joinPoint.getTarget().getClass().getName().replaceAll("et.template.", "")); //去掉前綴
            record.setMethod(joinPoint.getSignature().getName());
            record.setUserId(user.getId());
            record.setDescription(getMethodDescription(joinPoint));  
            record.setStatus(false);
            record.setParameter(params);
            record.setResult("["+e.getClass().getName()+"]" + e.getMessage());
            //insert
            dao.insertRecord(record);  
            System.out.println("=====異常通知結束=====");  
        } catch (Exception ex) {  
            //記錄Log  
            logger.error("==異常通知Exception==");  
            logger.error("異常訊息:{}", ex.getMessage());  
        }  
  
    }  

    /** 
     * 註解中的descript參數
     * 
     * @param joinPoint 切點
     * @return 方法描述
     * @throws Exception 
     */  
    private String getMethodDescription(JoinPoint joinPoint) throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class<?> targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class<?>[] clazzs = method.getParameterTypes();  
                if (clazzs.length == arguments.length) {  
                    description = method.getAnnotation(SystemLog.class).description();
                    break;  
                }  
            }  
        }  
        return description;  
    }
    
    private boolean isSaveParams(JoinPoint joinPoint) throws Exception {
    	String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class<?> targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        boolean saveParam = true;  
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class<?>[] clazzs = method.getParameterTypes();  
                if (clazzs.length == arguments.length) {  
                    saveParam = method.getAnnotation(SystemLog.class).saveParam();  
                    break;  
                }  
            }  
        }  
        return saveParam;
    }
    
    private boolean isSaveResult(JoinPoint joinPoint) throws Exception {
    	String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class<?> targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        boolean saveResult = true;  
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class<?>[] clazzs = method.getParameterTypes();  
                if (clazzs.length == arguments.length) {  
                	saveResult = method.getAnnotation(SystemLog.class).saveResult();  
                    break;  
                }  
            }  
        }  
        return saveResult;
    }
}
