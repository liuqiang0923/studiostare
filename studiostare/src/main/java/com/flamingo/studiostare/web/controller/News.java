package com.flamingo.studiostare.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.NewsEntity;
import com.flamingo.studiostare.entity.RoleEntity;
import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.service.INewsService;
import com.flamingo.studiostare.service.IUserService;

@Controller
public class News extends JsonAction {
	
	@Autowired
	private INewsService newsService;
	@Autowired
	private IUserService userService;
	
	private static RoleEntity role = new RoleEntity();
	
	static{
		role.setId(RoleEntity.ROLETYPE_TWITTER);
	}
	
	@RequestMapping("admin-news-list.html")
	public ModelAndView newsList() {
		ModelAndView m = new ModelAndView();
		NewsEntity news = new NewsEntity();
		List<NewsEntity> newslist = null;
		List<UserEntity> userList = null;
		try{
			newslist = newsService.findNews(news);
			userList = userService.getUserByType(RoleEntity.ROLETYPE_TWITTER);
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("newslist", newslist);
		m.addObject("userList", userList);
		m.setViewName("manage/admin-news-list");
		return m;
	}
	
	@RequestMapping("admin-news-edit.html")
	public ModelAndView newsEdit() {
		ModelAndView m = new ModelAndView();
		NewsEntity news = new NewsEntity();
		m.addObject("news", news);
		m.setViewName("manage/admin-news-edit");
		return m;
	}
	
	@RequestMapping(value="saveNews", method=RequestMethod.POST)
	public String saveNews(NewsEntity news, 
			@RequestParam(value="newsimg", required=false) MultipartFile newsimg, 
			@RequestParam(value="newsvideomp4", required=false) MultipartFile newsvideomp4,
			@RequestParam(value="newsvideowebm", required=false) MultipartFile newsvideowebm,
			@RequestParam(value="newsvideoogg", required=false) MultipartFile newsvideoogg,
			HttpSession session) {
		
		news.setUserId((int) session.getAttribute("userid"));
		
		try {
			newsService.save(news, newsimg, newsvideomp4,newsvideowebm,newsvideoogg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:admin-news-list.html";
	}
	
	@RequestMapping(value = "editNews", method = RequestMethod.GET)
	public ModelAndView editNews(@RequestParam("newsId") int newsId) {
		ModelAndView m = new ModelAndView();
		NewsEntity news = newsService.getById(newsId);
		m.addObject("news", news);
		m.setViewName("manage/admin-news-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteNews/{newsId}", method = RequestMethod.GET)
	public String deleteNews(@PathVariable int newsId, HttpServletResponse response) {
		newsService.delete(newsId);
		output(response, "{\"result\":\"ok\"}");
		return null;
	}
	
	@RequestMapping(value = "addTwitter", method = RequestMethod.GET)
	public ModelAndView addTwitter() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-news-twitter-edit");
		return m;
	}
	
	@RequestMapping(value = "editTwitterUser/{userId}", method = RequestMethod.GET)
	public ModelAndView editTwitterUser(@PathVariable int userId) {
		ModelAndView m = new ModelAndView();
		UserEntity userEntity  = null ;
		try{
			userEntity = userService.getById(userId);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(userEntity == null)
			userEntity = new UserEntity();
		m.addObject("twitter", userEntity);
		m.setViewName("manage/admin-news-twitter-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteTwitter/{twitterId}", method = RequestMethod.GET)
	public String deleteTwitter(@PathVariable int twitterId, HttpServletResponse response) {
		String result = "ok";
		try {
			userService.delById(twitterId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value = "saveTwitter", method = RequestMethod.POST)
	public String saveTwitter(UserEntity user, 
			@RequestParam(value="twitterimg", required=false) MultipartFile twitterimg, 
			HttpSession session) {
		user.setRole(role);
		try {
			userService.save(user,twitterimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-news-list.html";
	}
}
