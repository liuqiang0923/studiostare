package com.flamingo.studiostare.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return true;
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
	public void save(UserEntity userEntity) {
		int id = userEntity.getId();
		Date now = new Date();
		userEntity.setUpdateTime(now);
		if(id == 0 || getById(id) == null)
			userDao.insertUser(userEntity);
		else
			userDao.updateUser(userEntity);
	}

}
