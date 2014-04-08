package com.flamingo.studiostare.service;

import java.util.List;

import com.flamingo.studiostare.entity.VideoEntity;
import com.flamingo.studiostare.entity.VideoRefEntity;

public interface IVideoRefService {
	
	VideoRefEntity getById(int id);

	List<VideoRefEntity> getAll();
	
}
