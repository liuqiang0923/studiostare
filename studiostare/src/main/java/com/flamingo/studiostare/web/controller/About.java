package com.flamingo.studiostare.web.controller;

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
		role.setId(RoleEntity.ROLETYPE_ABOUTUS);
	}
	
	@RequestMapping("admin-about.html")
	public ModelAndView about() {
		ModelAndView m = new ModelAndView();
		AboutEntity about = null;
		List<UserEntity> whoList = null;
		try{
			about = aboutService.getById(1);
			whoList = userService.getUserByType(RoleEntity.ROLETYPE_ABOUTUS);
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("about",about);
		m.addObject("whoList", whoList);
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
		m.addObject("who", userEntity);
		m.setViewName("manage/admin-about-who-edit");
		return m;
	}
	
	@RequestMapping(value = "admin-admin.html", method = RequestMethod.GET)
	public ModelAndView editAdmin() {
		ModelAndView m = new ModelAndView();
		UserEntity userEntity  = null ;
		try{
			userEntity = userService.getById(1);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(userEntity == null)
			userEntity = new UserEntity();
		m.addObject("admin", userEntity);
		m.setViewName("manage/admin-admin");
		return m;
	}
	
	@RequestMapping(value = "deleteWho/{whoId}", method = RequestMethod.GET)
	public String deleteWho(@PathVariable int whoId, HttpServletResponse response) {
		String result = "ok";
		try {
			userService.delById(whoId);
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
	
	@RequestMapping(value = "saveAdmin", method = RequestMethod.POST)
	public String saveAdmin(UserEntity user, HttpSession session) {
		RoleEntity role = new RoleEntity();
		role.setId(1);
		user.setRole(role);
		try {
			userService.save(user, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-admin.html";
	}
	
	@RequestMapping(value = "editAboutInfo", method = RequestMethod.GET)
	public ModelAndView editAboutInfo() {
		ModelAndView m = new ModelAndView();
		AboutEntity aboutEntity  = null ;
		try{
			aboutEntity = aboutService.getById(1);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(aboutEntity == null)
			aboutEntity = new AboutEntity();
		m.addObject("about", aboutEntity);
		m.setViewName("manage/admin-about-edit");
		return m;
	}
	
	@RequestMapping(value="saveAboutInfo", method=RequestMethod.POST)
	public String saveAboutInfo(
			AboutEntity about,
			@RequestParam(value="officeimg", required=false) MultipartFile officeimg, HttpSession session){
		about.setId(1);
		try {
			aboutService.save(about, officeimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-about.html";
	}
	
	@RequestMapping(value="saveManifesto", method=RequestMethod.POST)
	public String saveManifesto(String manifesto, HttpServletResponse response){
		String result = "ok";
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}

	
}
