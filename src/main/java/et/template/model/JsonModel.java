package et.template.model;

public class JsonModel {

	private int code = 0;
	
	private String message;

	public JsonModel() {
		
	}
	
	public JsonModel(String message){
		this.message = message;
	}
	
	public JsonModel(int code, String message){
		this.code = code;
		this.message = message;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
