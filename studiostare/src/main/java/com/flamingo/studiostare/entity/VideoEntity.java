package com.flamingo.studiostare.entity;

import java.io.Serializable;
import java.util.Date;

public class VideoEntity implements Serializable {
	private static final long serialVersionUID = 1L; 
	private int id;
	private int index;
	private ClientEntity client;
	private CategoryEntity category;
	private String name;
	private String imgPath;
	private String videoPathWebm;
	private String videoPathMp4;
	private String videoPathOgg;
	private String description;
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
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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
	public String getVideoPathWebm() {
		return videoPathWebm;
	}
	public void setVideoPathWebm(String videoPathWebm) {
		this.videoPathWebm = videoPathWebm;
	}
	public String getVideoPathMp4() {
		return videoPathMp4;
	}
	public void setVideoPathMp4(String videoPathMp4) {
		this.videoPathMp4 = videoPathMp4;
	}
	public String getVideoPathOgg() {
		return videoPathOgg;
	}
	public void setVideoPathOgg(String videoPathOgg) {
		this.videoPathOgg = videoPathOgg;
	}
	public ClientEntity getClient() {
		return client;
	}
	public void setClient(ClientEntity client) {
		this.client = client;
	}
	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
}
