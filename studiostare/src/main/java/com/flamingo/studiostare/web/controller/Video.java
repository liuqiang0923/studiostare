package com.flamingo.studiostare.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.VideoRefEntity;
import com.flamingo.studiostare.service.ICategoryService;
import com.flamingo.studiostare.service.IClientService;
import com.flamingo.studiostare.service.IVideoRefService;
import com.flamingo.studiostare.service.IVideoService;

@Controller
public class Video {
	
	@Autowired
	private IVideoService videoService;
	@Autowired
	private IVideoRefService videoRefService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IClientService clientService;
	
	@RequestMapping("admin-video-list.html")
	public ModelAndView videoList() {
		ModelAndView m = new ModelAndView();
		List<VideoRefEntity> videoList = null;
		try{
			videoList = videoRefService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		if (videoList == null)
			videoList = new ArrayList<VideoRefEntity>();
		m.addObject("videoList", videoList);
		m.setViewName("manage/admin-video-list");
		return m;
	}
	
	@RequestMapping("admin-video-edit.html")
	public ModelAndView videoEdit() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-video-edit");
		return m;
	}
	
}
