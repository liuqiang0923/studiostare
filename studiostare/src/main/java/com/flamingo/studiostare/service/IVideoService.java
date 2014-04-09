package com.flamingo.studiostare.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.VideoEntity;

public interface IVideoService {
	
	VideoEntity getById(int id);

	void save(VideoEntity videoEntity, MultipartFile videoimg, MultipartFile videowebm, MultipartFile videoogg) throws IOException;

	List<VideoEntity> getAll();

	void delById(int videoId);
	
}
