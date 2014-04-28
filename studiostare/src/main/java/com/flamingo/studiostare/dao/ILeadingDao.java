package com.flamingo.studiostare.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flamingo.studiostare.entity.LeadingEntity;

@Repository
@Transactional
public interface ILeadingDao {

	LeadingEntity selectLeadingById(int id);

	void insertLeading(LeadingEntity leadingEntity);

	void updateLeading(LeadingEntity leadingEntity);

	void deleteLeadingById(int id);

	List<LeadingEntity> selectLeadingPic();
	
	List<LeadingEntity> selectLeadingTitle();

	void deleteLeading(LeadingEntity leadingEntity);
	
	int getAllNum();

}
