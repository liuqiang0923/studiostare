package com.flamingo.studiostare.service;

import java.util.List;

import com.flamingo.studiostare.entity.CategoryEntity;

public interface ICategoryService {
	
	CategoryEntity getById(int id);
	
	List<CategoryEntity> getAll();
	
	void delById(int id);
	
	void save(CategoryEntity categoryEntity);
	
}
