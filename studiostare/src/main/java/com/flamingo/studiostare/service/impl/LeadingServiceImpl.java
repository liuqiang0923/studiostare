package com.flamingo.studiostare.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.dao.ILeadingDao;
import com.flamingo.studiostare.entity.LeadingEntity;
import com.flamingo.studiostare.service.ILeadingService;

@Service("leadingService")
public class LeadingServiceImpl implements ILeadingService {

	@Autowired
	private ILeadingDao leadingDao;
	
	@Override
	public LeadingEntity getById(int id){
		return leadingDao.selectLeadingById(id);
	}
	
	@Override
	public List<LeadingEntity> getAll(){
		return leadingDao.selectLeading(new LeadingEntity());
	}

	@Override
	public void delById(int id){
		leadingDao.deleteLeadingById(id);
	}

	@Override
	public void save(LeadingEntity leadingEntity, MultipartFile leadingimg) throws IOException {
		int id = leadingEntity.getId();
		Date now = new Date();
		leadingEntity.setUpdateTime(now);
		LeadingEntity old = getById(id);
		if(leadingimg != null && leadingimg.getSize() != 0)
			leadingEntity.setPicPath(FileUtils.saveFile(leadingimg));
		if(id == 0 || old == null)
			leadingDao.insertLeading(leadingEntity);
		else{
			old.setTitle(leadingEntity.getTitle());
			old.setDescription(leadingEntity.getDescription());
			if(leadingEntity.getPicPath() != null)
				old.setPicPath(leadingEntity.getPicPath());
			leadingDao.updateLeading(old);
		}
	}

	@Override
	public LeadingEntity getOneByRandom() {
		int num = leadingDao.getAllNum();
		List<LeadingEntity> leadingList = getAll();
		if(leadingList == null || leadingList.size() == 0)
			return null;
		Random random = new Random();
		return leadingList.get(Math.abs(random.nextInt()) % num);
	}

}
