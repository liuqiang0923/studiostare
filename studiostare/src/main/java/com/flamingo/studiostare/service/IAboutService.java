package com.flamingo.studiostare.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.AboutEntity;

public interface IAboutService {
	
	AboutEntity getById(int id);

	void save(AboutEntity about, MultipartFile officeimg) throws IOException;
	
}
