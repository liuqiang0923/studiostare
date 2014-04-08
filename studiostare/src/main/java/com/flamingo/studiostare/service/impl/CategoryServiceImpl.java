package com.flamingo.studiostare.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flamingo.studiostare.dao.ICategoryDao;
import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.service.ICategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

	@Autowired
	private ICategoryDao categoryDao;
	
	@Override
	public CategoryEntity getById(int id) {
		return categoryDao.selectCategoryById(id);
	}

	@Override
	public List<CategoryEntity> getAll() {
		return categoryDao.selectCategory(new CategoryEntity());
	}

	@Override
	public void delById(int id){
		categoryDao.deleteCategoryById(id);
	}

	@Override
	public void save(CategoryEntity categoryEntity) {
		int id = categoryEntity.getId();
		Date now = new Date();
		categoryEntity.setUpdateTime(now);
		if(id == 0 || getById(id) == null)
			categoryDao.insertCategory(categoryEntity);
		else
			categoryDao.updateCategory(categoryEntity);
	}
	
}
