package com.flamingo.studiostare.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.entity.VideoEntity;

public interface IVideoService {
	
	VideoEntity getById(int id);

	void save(VideoEntity videoEntity, MultipartFile videoimg, MultipartFile videowebm, MultipartFile videomp4, MultipartFile videoogg) throws IOException;
	
	void save(VideoEntity videoEntity) throws IOException;

	List<VideoEntity> getAll();

	void delById(int videoId);

	List<VideoEntity> getByClientId(int id);

	List<VideoEntity> getByCategoryId(int id);
	
	List<VideoEntity> getByVideoEntity(VideoEntity videoEntity);

	List<VideoEntity> getAllActive();

	List<VideoEntity> getByClient(ClientEntity client);

	List<VideoEntity> getByCategory(CategoryEntity category);
}
