package com.flamingo.studiostare.entity;

import java.io.Serializable;
import java.util.Date;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.common.StringUtils;

public class NewsEntity implements Serializable {
	private static final long serialVersionUID = 1L; 
	private int id;
	private String title;
	private String content;
	private String photoPath;
	private String videoPathWebm;
	private String videoPathMp4;
	private String videoPathOgg;
	private int userId;
	private long twitterId;
	private Date updateTime;
	private String dateStr;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public long getTwitterId() {
		return twitterId;
	}
	public void setTwitterId(long twitterId) {
		this.twitterId = twitterId;
	}
	
	public String getPhotoName() {
		if (!StringUtils.isNull(photoPath)) {
			return FileUtils.getFileName(photoPath);
		}
		return "";
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
	public String getVideoNameMp4() {
		if (!StringUtils.isNull(getVideoPathMp4())) {
			return FileUtils.getFileName(getVideoPathMp4());
		}
		return "";
	}
	public String getVideoNameWebm() {
		if (!StringUtils.isNull(getVideoPathWebm())) {
			return FileUtils.getFileName(getVideoPathWebm());
		}
		return "";
	}
	public String getVideoNameOgg() {
		if (!StringUtils.isNull(getVideoPathOgg())) {
			return FileUtils.getFileName(getVideoPathOgg());
		}
		return "";
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
}
