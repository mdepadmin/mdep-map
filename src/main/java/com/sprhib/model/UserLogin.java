package com.sprhib.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="UserLogin")
public class UserLogin {
	@Id
	private String userId;
	private String password;
	private String userType; 
	
	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
}
