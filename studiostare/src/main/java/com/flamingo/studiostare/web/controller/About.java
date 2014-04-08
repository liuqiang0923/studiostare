package com.flamingo.studiostare.web.controller;

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

import com.flamingo.studiostare.entity.AboutEntity;
import com.flamingo.studiostare.entity.RoleEntity;
import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.service.IAboutService;
import com.flamingo.studiostare.service.IUserService;

@Controller
public class About extends JsonAction {
	
	@Autowired
	private IAboutService aboutService;
	@Autowired
	private IUserService userService;
	
	private static RoleEntity role = new RoleEntity();
	
	static{
		role.setId(RoleEntity.ROLEType_ABOUTUS);
	}
	
	@RequestMapping("admin-about.html")
	public ModelAndView about() {
		ModelAndView m = new ModelAndView();
		AboutEntity about = aboutService.getById(1);
		m.addObject("about",about);
		m.setViewName("manage/admin-about");
		return m;
	}
	
	@RequestMapping(value = "addWho", method = RequestMethod.GET)
	public ModelAndView addWho() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-about-who-edit");
		return m;
	}
	
	@RequestMapping(value = "editWho/{userId}", method = RequestMethod.GET)
	public ModelAndView editWho(@PathVariable int userId) {
		ModelAndView m = new ModelAndView();
		UserEntity userEntity  = null ;
		try{
			userEntity = userService.getById(userId);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(userEntity == null)
			userEntity = new UserEntity();
		m.addObject("user", userEntity);
		m.setViewName("manage/admin-about-who-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteWho/{clientId}", method = RequestMethod.GET)
	public String deleteWho(@PathVariable int clientId, HttpServletResponse response) {
		String result = "ok";
		try {
			userService.delById(clientId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value = "saveWho", method = RequestMethod.POST)
	public String saveWho(UserEntity user, 
			@RequestParam(value="whoimg", required=false) MultipartFile whoimg, 
			HttpSession session) {
		user.setRole(role);
		try {
			userService.save(user,whoimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-about.html";
	}
	
	@RequestMapping(value="saveAboutInfo", method=RequestMethod.POST)
	public String saveAboutInfo(@RequestParam(value="newsimg", required=false) MultipartFile officeimg, HttpServletResponse response){
		
		return null;
	}
	
	@RequestMapping(value="saveManifesto", method=RequestMethod.POST)
	public String saveManifesto(String manifesto, HttpServletResponse response){
		String result = "ok";
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
}
