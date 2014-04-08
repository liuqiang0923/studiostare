package com.flamingo.studiostare.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.entity.UserEntity;

public interface IUserService {
	
	boolean checkLogin(UserEntity userEntity);
	
	UserEntity getById(int id);
	
	List<UserEntity> getUserByType(int type);
	
	void delById(int id);
	
	void save(UserEntity userEntity, MultipartFile whoimg) throws IOException;
	
}
