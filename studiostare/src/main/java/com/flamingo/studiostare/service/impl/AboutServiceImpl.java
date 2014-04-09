package com.flamingo.studiostare.service.impl;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.dao.IAboutDao;
import com.flamingo.studiostare.entity.AboutEntity;
import com.flamingo.studiostare.service.IAboutService;

@Service("aboutService")  
public class AboutServiceImpl implements IAboutService {

	@Autowired
	private IAboutDao aboutDao;
	
	@Override
	public AboutEntity getById(int id) {
		return aboutDao.selectAboutById(id);
	}

	@Override
	public void save(AboutEntity about, MultipartFile officeimg) throws IOException {
		about.setUpdateTime(new Date());
		if(officeimg != null && officeimg.getSize() != 0)
			about.setOfficeImgPath(FileUtils.saveFile(officeimg));
		int id = about.getId();
		if(id == 0){
			aboutDao.insertAbout(about);
			return;
		}
		AboutEntity old = getById(id);
		if(old == null){
			aboutDao.insertAbout(about);
			return;
		}
		old.setAboutUsInfo(about.getAboutUsInfo());
		old.setManifesto(about.getManifesto());
		if(about.getOfficeImgPath() != null)
			old.setOfficeImgPath(about.getOfficeImgPath());
		aboutDao.updateAbout(old);
	}

}
