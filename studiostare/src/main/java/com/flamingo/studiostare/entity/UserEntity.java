package com.flamingo.studiostare.entity;

import java.io.Serializable;
import java.util.Date;

public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String password;
	private String email;
	private RoleEntity role;
	private int captureNewsFlag;
	private String twitterUser;
	private Date updateTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCaptureNewsFlag() {
		return captureNewsFlag;
	}
	public void setCaptureNewsFlag(int captureNewsFlag) {
		this.captureNewsFlag = captureNewsFlag;
	}
	public String getTwitterUser() {
		return twitterUser;
	}
	public void setTwitterUser(String twitterUser) {
		this.twitterUser = twitterUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getEmail() {
		return email;
	}
	public RoleEntity getRole() {
		return role;
	}
	public void setRole(RoleEntity role) {
		this.role = role;
	}
	

}
