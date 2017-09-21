package et.template.model;

import java.sql.Timestamp;

public class User {
    
	private Integer id;

	private String userName;
	
	private String password;
	
	private Boolean status;

	private Timestamp createDate;
	
	private Timestamp pwdChange;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}
	
	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	
	public Timestamp getPwdChange() {
		return pwdChange;
	}

	public void setPwdChange(Timestamp pwdChange) {
		this.pwdChange = pwdChange;
	}
}
