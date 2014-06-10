package com.flamingo.studiostare.web.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
public class StudioStare extends JsonAction {
	
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
	
	private SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy", Locale.US);
	
	@RequestMapping(value="index.html")
	public ModelAndView index() {
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		LeadingEntity leadingEntity = null;
		LeadingEntity leadingEntityText = null;
		try{
			videoList = videoService.getAllActive();
//			videoList = videoList.subList(0, (videoList.size() > 6) ? 6 : videoList.size());
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
//			videoList = videoList.subList(0, (videoList.size() > 6) ? 6 : videoList.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("videoList", videoList);
		m.setViewName("work");
		return m;
	}
	
	@RequestMapping(value="video/{pageid}",  method = RequestMethod.GET)
	public String nextVideos(@PathVariable int pageid, HttpServletResponse response) {
		String result = "ok";
		List<VideoEntity> videoList = null;
		try{
			videoList = videoService.getAllActive();
			if(pageid * 6 > videoList.size())
				videoList = null;
			else
				videoList = videoList.subList(pageid * 6, ((pageid + 1) * 6 < videoList.size()) ? (pageid + 1) * 6 : videoList.size());
			output(response, "{\"result\":\"" + result + "\",\"videos\":" + JSONArray.fromObject(videoList).toString() + "}" );
		}catch(Exception e){
			e.printStackTrace();
			result = "error";
			output(response, "{\"result\":\"" + result + "\"}");
		}
		return null;
	}
	
	@RequestMapping(value="news.html")
	public ModelAndView news() {
		ModelAndView m = new ModelAndView();
		NewsEntity news = new NewsEntity();
		List<NewsEntity> newsList = null;
		try{
			newsList = newsService.findNews(news);
			newsList = newsList.subList(0, (newsList.size() > 6) ? 6 : newsList.size());
			for(NewsEntity nnews : newsList){
				nnews.setDateStr(sdf.format(nnews.getUpdateTime()));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("newsList", newsList);
		m.setViewName("news");
		return m;
	}
	
	@RequestMapping(value="news/{pageid}",  method = RequestMethod.GET)
	public String nextNews(@PathVariable int pageid, HttpServletResponse response) {
		String result = "ok";
		NewsEntity news = new NewsEntity();
		List<NewsEntity> newsList = null;
		try{
			newsList = newsService.findNews(news);
			if(pageid * 6 > newsList.size())
				newsList = null;
			else
				newsList = newsList.subList(pageid * 6, ((pageid + 1) * 6 < newsList.size()) ? (pageid + 1) * 6 : newsList.size());
			for(NewsEntity nnews : newsList){
				nnews.setDateStr(sdf.format(nnews.getUpdateTime()));
			}
			output(response, "{\"result\":\"" + result + "\",\"news\":" + JSONArray.fromObject(newsList).toString() + "}" );
		}catch(Exception e){
			e.printStackTrace();
			result = "error";
			output(response, "{\"result\":\"" + result + "\"}");
		}
		return null;
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
	
	@RequestMapping(value="client/{clientName}", method = RequestMethod.GET)
	public ModelAndView videoOfClient(@PathVariable String clientName) {
		ModelAndView m = new ModelAndView();
		ClientEntity client = null;
		List<VideoEntity> videoList = null;
		try{
			client = clientService.getClientByName(clientName);
			videoList = videoService.getByClient(client);
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("client", client);
		m.addObject("videoList", videoList);
		m.setViewName("event");
		return m;
	}
	
	@RequestMapping(value="category/{categoryName}", method = RequestMethod.GET)
	public ModelAndView videoOfCategory(@PathVariable String categoryName) {
		ModelAndView m = new ModelAndView();
		CategoryEntity category = null;
		List<VideoEntity> videoList = null;
		try{
			category = categoryService.getCategoryByName(categoryName);
			videoList = videoService.getByCategory(category);
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("category", category);
		m.addObject("videoList", videoList);
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
