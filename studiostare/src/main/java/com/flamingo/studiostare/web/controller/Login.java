package com.flamingo.studiostare.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.service.IClientService;

@Controller
@RequestMapping("login")
public class Login {
	
	@Autowired
	private IClientService clientService;
	
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-login");
		return m;
	}
	
}
