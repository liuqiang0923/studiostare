package com.flamingo.studiostare.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.AboutEntity;
import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.entity.LeadingEntity;
import com.flamingo.studiostare.entity.NewsEntity;
import com.flamingo.studiostare.entity.RoleEntity;
import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.entity.VideoEntity;
import com.flamingo.studiostare.service.IAboutService;
import com.flamingo.studiostare.service.ICategoryService;
import com.flamingo.studiostare.service.IClientService;
import com.flamingo.studiostare.service.ILeadingService;
import com.flamingo.studiostare.service.INewsService;
import com.flamingo.studiostare.service.IUserService;
import com.flamingo.studiostare.service.IVideoService;

@Controller
public class StudioStare {
	
	@Autowired
	private IVideoService videoService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IClientService clientService;
	@Autowired
	private IAboutService aboutService;
	@Autowired
	private IUserService userService;
	@Autowired
	private INewsService newsService;
	@Autowired
	private ILeadingService leadingService;
	
	@RequestMapping(value="index.html")
	public ModelAndView index() {
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		LeadingEntity leadingEntity = null;
		LeadingEntity leadingEntityText = null;
		try{
			videoList = videoService.getAllActive();
			leadingEntity = leadingService.getOnePicByRandom();
			leadingEntityText = leadingService.getOneWordByRandom();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("leading", leadingEntity);
		m.addObject("leadingText", leadingEntityText);
		m.addObject("videoList", videoList);
		m.setViewName("index");
		return m;
	}
	
	@RequestMapping(value="work.html")
	public ModelAndView work() {
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		try{
			videoList = videoService.getAllActive();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("videoList", videoList);
		m.setViewName("work");
		return m;
	}
	
	@RequestMapping(value="news.html")
	public ModelAndView news() {
		ModelAndView m = new ModelAndView();
		NewsEntity news = new NewsEntity();
		List<NewsEntity> newsList = null;
		try{
			newsList = newsService.findNews(news);
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("newsList", newsList);
		m.setViewName("news");
		return m;
	}
	
	@RequestMapping(value="clients.html")
	public ModelAndView clients() {
		ModelAndView m = new ModelAndView();
		List<ClientEntity> clientList = null;
		List<CategoryEntity> categoryList = null;
		AboutEntity clientPic = null;
		try{
			clientList = clientService.getAll();
			categoryList = categoryService.getAll();
			clientPic = aboutService.getById(2);
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("clientPic",clientPic);
		m.addObject("clientList", clientList);
		m.addObject("categoryList", categoryList);
		m.setViewName("clients");
		return m;
	}
	
	@RequestMapping(value="videoOfClient/{clientId}", method = RequestMethod.GET)
	public ModelAndView videoOfClient(@PathVariable int clientId) {
		ModelAndView m = new ModelAndView();
		ClientEntity client = null;
		List<VideoEntity> videoList = null;
		List<CategoryEntity> categoryList = null;
		try{
			client = clientService.getById(clientId);
			videoList = videoService.getByClient(clientId);
			categoryList = categoryService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("client", client);
		m.addObject("videoList", videoList);
		m.addObject("categoryList", categoryList);
		m.setViewName("event");
		return m;
	}
	
	@RequestMapping(value="videoOfCategory/{categoryId}", method = RequestMethod.GET)
	public ModelAndView videoOfCategory(@PathVariable int categoryId) {
		ModelAndView m = new ModelAndView();
		CategoryEntity category = null;
		List<VideoEntity> videoList = null;
		List<CategoryEntity> categoryList = null;
		try{
			category = categoryService.getById(categoryId);
			videoList = videoService.getByCategory(categoryId);
			categoryList = categoryService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("category", category);
		m.addObject("videoList", videoList);
		m.addObject("categoryList", categoryList);
		m.setViewName("event");
		return m;
	}
	
	@RequestMapping(value="about.html")
	public ModelAndView about() {
		ModelAndView m = new ModelAndView();
		AboutEntity about = null;
		List<UserEntity> whoList = null;
//		List<LeadingEntity> leadingList = null;
		try{
			about = aboutService.getById(1);
			whoList = userService.getUserByType(RoleEntity.ROLETYPE_ABOUTUS);
//			leadingList = leadingService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		}
		if(about != null)
			about.setAboutUsInfo(about.getAboutUsInfo().toUpperCase());
		m.addObject("about",about);
		m.addObject("whoList", whoList);
//		m.addObject("leadingList", leadingList);
		m.setViewName("about");
		return m;
	}
	
}
