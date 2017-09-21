package et.template.exception;

public class LoginException extends RuntimeException {

	private static final long serialVersionUID = -344145729874447043L;
		 
	public static final String LOGIN_ERROR = "100";
	public static final String ERR_NO_USER = "101";
	public static final String ERR_VALIDATE_FAIL= "102";
	public static final String ERR_PWD_EXPIRE= "103";
	public static final String DUPLICATE_USER_ACCOUNT = "104";

	public LoginException(String errMsg){
		super(errMsg);
	}

}
