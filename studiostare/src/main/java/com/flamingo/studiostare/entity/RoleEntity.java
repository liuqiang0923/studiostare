package com.flamingo.studiostare.entity;

import java.io.Serializable;

public class RoleEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final int ROLETYPE_ADMIN = 1;
	public static final int ROLETYPE_TWITTER = 2;
	public static final int ROLEType_ABOUTUS = 3;
	private int id;
	private String name;
	private String description;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
