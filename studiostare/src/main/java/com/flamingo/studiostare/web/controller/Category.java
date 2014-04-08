package com.flamingo.studiostare.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.service.ICategoryService;

@Controller
public class Category extends JsonAction {
	
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping("admin-category-list.html")
	public ModelAndView categoryList() {
		ModelAndView m = new ModelAndView();
		List<CategoryEntity> categoryList = categoryService.getAll();
		if (categoryList == null)
			categoryList = new ArrayList<CategoryEntity>();
		m.addObject("categoryList", categoryList);
		m.setViewName("manage/admin-category-list");
		return m;
	}
	
	@RequestMapping(value = "addCategory", method = RequestMethod.GET)
	public ModelAndView addCategory() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-category-edit");
		return m;
	}
	
	@RequestMapping(value = "editCategory/{categoryId}", method = RequestMethod.GET)
	public ModelAndView editClient(@PathVariable int categoryId) {
		ModelAndView m = new ModelAndView();
		CategoryEntity categoryEntity = categoryService.getById(categoryId);
		m.addObject("category", categoryEntity);
		m.setViewName("manage/admin-category-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteCategory/{categoryId}", method = RequestMethod.GET)
	public String deleteClient(@PathVariable int categoryId, HttpServletResponse response) {
		String result = "ok";
		try {
			categoryService.delById(categoryId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value = "saveCategory", method = RequestMethod.POST)
	public String savaCategory(CategoryEntity category, Model model, HttpSession session) {
		try {
			categoryService.save(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-category-list.html";
	}
	
}
