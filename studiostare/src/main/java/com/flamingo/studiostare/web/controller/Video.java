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

import com.flamingo.studiostare.entity.CategoryEntity;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.entity.VideoEntity;
import com.flamingo.studiostare.service.ICategoryService;
import com.flamingo.studiostare.service.IClientService;
import com.flamingo.studiostare.service.IVideoService;

@Controller
public class Video extends JsonAction {
	
	@Autowired
	private IVideoService videoService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IClientService clientService;
	
	@RequestMapping("admin-video-list.html")
	public ModelAndView videoList() {
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		try{
			videoList = videoService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("videoList", videoList);
		m.setViewName("manage/admin-video-list");
		return m;
	}
	
	@RequestMapping("addVideo")
	public ModelAndView addVideo() {
		ModelAndView m = new ModelAndView();
		List<ClientEntity> clientList = null;
		List<CategoryEntity> categoryList = null;
		try{
			clientList = clientService.getAll();
			categoryList = categoryService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("clientList", clientList);
		m.addObject("categoryList", categoryList);
		m.setViewName("manage/admin-video-edit");
		return m;
	}
	
	@RequestMapping(value = "editVideo/{videoId}", method = RequestMethod.GET)
	public ModelAndView editVideo(@PathVariable int videoId) {
		ModelAndView m = new ModelAndView();
		VideoEntity videoEntity  = null ;
		List<ClientEntity> clientList = null;
		List<CategoryEntity> categoryList = null;
		try{
			videoEntity = videoService.getById(videoId);
			clientList = clientService.getAll();
			categoryList = categoryService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("clientList", clientList);
		m.addObject("categoryList", categoryList);
		m.addObject("video", videoEntity);
		m.setViewName("manage/admin-video-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteVideo/{videoId}", method = RequestMethod.GET)
	public String deleteVideo(@PathVariable int videoId, HttpServletResponse response) {
		String result = "ok";
		try {
			videoService.delById(videoId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value="saveVideo", method=RequestMethod.POST)
	public String saveVideo(
			VideoEntity video,
			@RequestParam(value="videoimg", required=false) MultipartFile videoimg,
			@RequestParam(value="videomp4", required=false) MultipartFile videomp4,
			@RequestParam(value="videowebm", required=false) MultipartFile videowebm,
			@RequestParam(value="videoogg", required=false) MultipartFile videoogg,
			HttpSession session){
		try {
			video.setType(0);
			videoService.save(video, videoimg, videomp4, videowebm, videoogg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-video-list.html";
	}
	
	@RequestMapping(value="changeVideoOrder/{nowid}/{lastid}/{nextid}", method=RequestMethod.GET)
	public ModelAndView changeVideoOrder(@PathVariable int nowid, @PathVariable int lastid, @PathVariable int nextid, HttpSession session){
		if(lastid != 0){
			try{
				int lastOrder = videoService.getById(lastid).getIndex();
				VideoEntity video = videoService.getById(nowid);
				video.setIndex(++lastOrder);
				videoService.save(video);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(nextid != 0){
			try{
				int nextOrder = videoService.getById(nextid).getIndex();
				VideoEntity video = videoService.getById(nowid);
				video.setIndex(--nextOrder);
				videoService.save(video);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		try{
			videoList = videoService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("videoList", videoList);
		m.setViewName("manage/admin-video-list");
		return m;
	}
	
	@RequestMapping(value="showOrHideVideo/{ids}", method=RequestMethod.GET)
	public ModelAndView showOrHideVideo(@PathVariable String ids, HttpSession session){
		String[] ida = ids.split(",");
		for(int i = 0 ; i < ida.length ; i++){
			Integer id = Integer.parseInt(ida[i]);
			if(id == null || id == 0)
				continue;
			try {
				VideoEntity video = videoService.getById(id);
				video.setType(video.getType() ^ 1);
				videoService.save(video);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ModelAndView m = new ModelAndView();
		List<VideoEntity> videoList = null;
		try{
			videoList = videoService.getAll();
		}catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("videoList", videoList);
		m.setViewName("manage/admin-video-list");
		return m;
	}
	
}
