package com.flamingo.studiostare.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.dao.IVideoDao;
import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.entity.VideoEntity;
import com.flamingo.studiostare.service.IVideoService;

@Service("videoService")
public class VideoServiceImpl implements IVideoService {

	@Autowired
	private IVideoDao videoDao;
	
	@Override
	public VideoEntity getById(int id) {
		return videoDao.selectVideoById(id);
	}
	
	@Override
	public void save(VideoEntity videoEntity, MultipartFile videoimg, MultipartFile videomp4, MultipartFile videowebm, MultipartFile videoogg) throws IOException {
		Date now = new Date();
		
		videoEntity.setUpdateTime(now);
		
		if(videoimg != null && videoimg.getSize() != 0)
			videoEntity.setImgPath(FileUtils.saveFile(videoimg));
		if(videomp4 != null && videomp4.getSize() != 0)
			videoEntity.setVideoPathMp4(FileUtils.saveFile(videomp4));
		if(videowebm != null && videowebm.getSize() != 0)
			videoEntity.setVideoPathWebm(FileUtils.saveFile(videowebm));
		if(videoogg != null & videoogg.getSize() != 0)
			videoEntity.setVideoPathOgg(FileUtils.saveFile(videoogg));
		
		int vId = videoEntity.getId();
		VideoEntity oldVideo = videoDao.selectVideoById(vId);
		
		if(vId == 0 || oldVideo == null)
			videoDao.insertVideo(videoEntity);
		else{
			oldVideo.setIndex(videoEntity.getIndex());
			oldVideo.setName(videoEntity.getName());
			oldVideo.setDescription(videoEntity.getDescription());
			if(videoEntity.getImgPath() != null)
				oldVideo.setImgPath(videoEntity.getImgPath());
			if(videoEntity.getVideoPathMp4() != null)
				oldVideo.setVideoPathMp4(videoEntity.getVideoPathMp4());
			if(videoEntity.getVideoPathWebm() != null)
				oldVideo.setVideoPathWebm(videoEntity.getVideoPathWebm());
			if(videoEntity.getVideoPathOgg() != null)
				oldVideo.setVideoPathOgg(videoEntity.getVideoPathOgg());
			videoDao.updateVideo(oldVideo);
		}
		
	}

	@Override
	public List<VideoEntity> getAll() {
		return videoDao.selectVideo(new VideoEntity());
	}
	
	@Override
	public List<VideoEntity> getByClient(int id) {
		ClientEntity client = new ClientEntity();
		client.setId(id);
		VideoEntity video = new VideoEntity();
		video.setClient(client);
		return getByVideoEntity(video);
	}
	
	@Override
	public List<VideoEntity> getByCategory(int id) {
		CategoryEntity category = new CategoryEntity();
		category.setId(id);
		VideoEntity video = new VideoEntity();
		video.setCategory(category);
		return getByVideoEntity(video);
	}
	
	@Override
	public List<VideoEntity> getByVideoEntity(VideoEntity videoEntity) {
		return videoDao.selectVideo(videoEntity);
	}

	@Override
	public void delById(int videoId) {
		videoDao.deleteVideoById(videoId);
	}
	
}
