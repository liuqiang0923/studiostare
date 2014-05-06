package com.flamingo.studiostare.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.dao.IUserDao;
import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired  
    private IUserDao userDao;  
	
	@Override
	public UserEntity getById(int id) {
        return userDao.selectUserById(id);
	}

	@Override
	public boolean checkLogin(UserEntity userEntity) {
		try{
			UserEntity user = userDao.selectUserById(1);
			return user.getName().equals(userEntity.getName()) && user.getPassword().equals(userEntity.getPassword());
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<UserEntity> getUserByType(int type) {
		return userDao.selectUserByRoleId(type);
	}

	@Override
	public void delById(int id) {
		userDao.deleteUserById(id);
	}

	@Override
	public void save(UserEntity userEntity, MultipartFile whoimg) throws IOException {
		int id = userEntity.getId();
		Date now = new Date();
		userEntity.setUpdateTime(now);
		UserEntity old = getById(id);
		if(whoimg != null && whoimg.getSize() != 0)
			userEntity.setPhotoPath(FileUtils.saveFile(whoimg));
		if(id == 0 || old == null)
			userDao.insertUser(userEntity);
		else{
			old.setName(userEntity.getName());
			old.setPassword(userEntity.getPassword());
			old.setPosition(userEntity.getPosition());
			old.setEmail(userEntity.getEmail());
			old.setDescription(userEntity.getDescription());
			if(userEntity.getPhotoPath() != null)
				old.setPhotoPath(userEntity.getPhotoPath());
			userDao.updateUser(old);
		}
	}
	
}
