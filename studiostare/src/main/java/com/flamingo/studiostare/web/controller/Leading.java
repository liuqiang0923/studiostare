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

import com.flamingo.studiostare.entity.LeadingEntity;
import com.flamingo.studiostare.service.ILeadingService;

@Controller
public class Leading extends JsonAction {
	
	@Autowired
	private ILeadingService leadingService;
	
	@RequestMapping(value="admin-leading-list.html", method = RequestMethod.GET)
	public ModelAndView leadingList() {
		ModelAndView m = new ModelAndView();
		List<LeadingEntity> leadingList = null;
		try{
			leadingList = leadingService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("leadingList", leadingList);
		m.setViewName("manage/admin-leading-list");
		return m;
	}

	@RequestMapping(value = "addLeading", method = RequestMethod.GET)
	public ModelAndView addLeading() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-leading-edit");
		return m;
	}
	
	@RequestMapping(value = "editLeading/{leadingId}", method = RequestMethod.GET)
	public ModelAndView editLeading(@PathVariable int leadingId) {
		ModelAndView m = new ModelAndView();
		LeadingEntity leadingEntity  = null ;
		try{
			leadingEntity = leadingService.getById(leadingId);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(leadingEntity == null)
			leadingEntity = new LeadingEntity();
		m.addObject("leading", leadingEntity);
		m.setViewName("manage/admin-leading-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteLeading/{leadingId}", method = RequestMethod.GET)
	public String deleteLeading(@PathVariable int leadingId, HttpServletResponse response) {
		String result = "ok";
		try {
			leadingService.delById(leadingId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value = "saveLeading", method = RequestMethod.POST)
	public String saveLeading(LeadingEntity leading, 
			@RequestParam(value="leadingimg", required=false) MultipartFile leadingimg, 
			HttpSession session) {
		try {
			leadingService.save(leading, leadingimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-leading-list.html";
	}
}
