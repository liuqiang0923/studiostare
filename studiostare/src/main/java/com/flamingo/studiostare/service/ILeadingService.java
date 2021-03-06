package com.flamingo.studiostare.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.LeadingEntity;

public interface ILeadingService {
	
	LeadingEntity getById(int id);
	
	List<LeadingEntity> getAllPicture();
	
	List<LeadingEntity> getAllWord();
	
	void delById(int id);
	
	void save(LeadingEntity leadingEntity, MultipartFile leadingimg) throws IOException;

	LeadingEntity getOnePicByRandom();
	
	LeadingEntity getOneWordByRandom();
	
}
