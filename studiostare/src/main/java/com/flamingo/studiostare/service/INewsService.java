package com.flamingo.studiostare.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.NewsEntity;

public interface INewsService {
	
	NewsEntity getById(int id);

	List<NewsEntity> findNews(NewsEntity news);

	void save(NewsEntity news, MultipartFile newsimg, MultipartFile newsvideo)
			throws IOException;

	void delete(int id);
	
	long getMaxTwitterId();

	void add(NewsEntity news);
}
