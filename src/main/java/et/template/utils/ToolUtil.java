package et.template.utils;

import java.security.MessageDigest;
import org.apache.commons.codec.binary.Hex;

public class ToolUtil {

	public static String MD5Message(String source) {

		String result = "";

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(source.getBytes("UTF-8"));
			result = Hex.encodeHexString(bytes);
		} catch (Exception e) {
			result = "";
		}

		return result;
	}
	
	public static void main(String[] args){
		String passMd5 = "";
		MessageDigest messageDigest = null;
  		try {  
			messageDigest = MessageDigest.getInstance("MD5");  
			messageDigest.reset();  
			messageDigest.update("123".getBytes("UTF-8"));    
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

		byte[] byteArray = messageDigest.digest();  
		StringBuffer md5StrBuff = new StringBuffer();  

		for (int i = 0; i < byteArray.length; i++) {  
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1){  
				md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));  
			}else{  
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));  
			}
		}
		passMd5 = md5StrBuff.toString();
		System.out.println(passMd5);
		
	}
}
