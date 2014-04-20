package com.flamingo.studiostare.entity;

import java.io.Serializable;
import java.util.Date;

public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String description;
	private Date updateTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		if(name != null)
			return name.toLowerCase();
		return null;
	}
	public void setName(String name) {
		if(name != null)
			this.name = name.toLowerCase();
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
