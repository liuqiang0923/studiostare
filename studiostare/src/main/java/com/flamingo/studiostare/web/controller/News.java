package com.flamingo.studiostare.web.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.flamingo.studiostare.service.INewsService;

@Controller
public class News extends JsonAction {
	
	@Autowired
	private INewsService newsService;
	
	@RequestMapping("admin-news-list.html")
	public ModelAndView newsList() {
		ModelAndView m = new ModelAndView();
		NewsEntity news = new NewsEntity();
		List<NewsEntity> newslist = newsService.findNews(news);
		if (newslist == null)
			newslist = new ArrayList<NewsEntity>();
		m.addObject("newslist", newslist);
		m.setViewName("manage/admin-news-list");
		return m;
	}
	
	@RequestMapping("admin-news-edit.html")
	public ModelAndView newsEdit() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-news-edit");
		return m;
	}
	
	@RequestMapping(value="saveNews", method=RequestMethod.POST)
	public String saveNews(NewsEntity news, 
			@RequestParam(value="newsimg", required=false) MultipartFile newsimg, 
			@RequestParam(value="newsvideo", required=false) MultipartFile newsvideo,
			HttpSession session) {
		
		news.setUserId((int) session.getAttribute("userid"));
		
		try {
			newsService.save(news, newsimg, newsvideo);
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
	
	
}
