package com.flamingo.studiostare.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.service.IUserService;

@Controller
public class Login {
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="admin-login.html", method=RequestMethod.GET)
	public ModelAndView loginpage() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-login");
		return m;
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(UserEntity user, Model model, HttpSession session) {
		if (!userService.checkLogin(user)) {
			return "manage/admin-login";
		}
		// Ìí¼Ósession
		session.setAttribute("userid", 1);
		return "redirect:admin-video-list.html";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userid");
		return "manage/admin-login";
	}
	
}
