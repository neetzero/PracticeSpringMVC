package et.template.exception;

public class GenericException extends RuntimeException {
	
	private static final long serialVersionUID = -4119367446586005716L;
	
	private String errCode;
	private String errMsg;

	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	public GenericException(String errMsg){
		super(errMsg);
	}
	
	public GenericException(String errCode, String errMsg) {
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
}
