package com.flamingo.studiostare.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.service.IClientService;

@Controller
public class VideoEdit {
	
	@Autowired
	private IClientService clientService;
	
	@RequestMapping("admin-video-edit.html")
	public ModelAndView videoEdit() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-video-edit");
		return m;
	}
	
}
