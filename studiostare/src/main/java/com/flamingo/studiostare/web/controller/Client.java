package com.flamingo.studiostare.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.AboutEntity;
import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.service.IAboutService;
import com.flamingo.studiostare.service.IClientService;

@Controller
public class Client extends JsonAction {

	@Autowired
	private IClientService clientService;
	@Autowired
	private IAboutService aboutService;

	@RequestMapping(value="admin-client-list.html", method = RequestMethod.GET)
	public ModelAndView clientList() {
		ModelAndView m = new ModelAndView();
		List<ClientEntity> clientList = null;
		AboutEntity clientPic = null;
		try{
			clientPic = aboutService.getById(2);
			clientList = clientService.getAll();
		} catch(Exception e){
			e.printStackTrace();
		}
		m.addObject("clientPic",clientPic);
		m.addObject("clientList", clientList);
		m.setViewName("manage/admin-client-list");
		return m;
	}

	@RequestMapping(value = "addClient", method = RequestMethod.GET)
	public ModelAndView addClient() {
		ModelAndView m = new ModelAndView();
		m.setViewName("manage/admin-client-edit");
		return m;
	}
	
	@RequestMapping(value = "editClient/{clientId}", method = RequestMethod.GET)
	public ModelAndView editClient(@PathVariable int clientId) {
		ModelAndView m = new ModelAndView();
		ClientEntity clientEntity  = null ;
		try{
			clientEntity = clientService.getById(clientId);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(clientEntity == null)
			clientEntity = new ClientEntity();
		m.addObject("client", clientEntity);
		m.setViewName("manage/admin-client-edit");
		return m;
	}
	
	@RequestMapping(value = "deleteClient/{clientId}", method = RequestMethod.GET)
	public String deleteClient(@PathVariable int clientId, HttpServletResponse response) {
		String result = "ok";
		try {
			clientService.delById(clientId);
		} catch (Exception e) {
			result = "error";
		}
		output(response, "{\"result\":\"" + result + "\"}");
		return null;
	}
	
	@RequestMapping(value = "saveClient", method = RequestMethod.POST)
	public String savaClient(ClientEntity client, Model model, HttpSession session) {
		try {
			clientService.save(client);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-client-list.html";
	}
	
	@RequestMapping(value = "changeClientPic", method = RequestMethod.GET)
	public ModelAndView editAboutInfo() {
		ModelAndView m = new ModelAndView();
		AboutEntity aboutEntity  = null ;
		try{
			aboutEntity = aboutService.getById(2);
		} catch(Exception e){
			e.printStackTrace();
		}
		if(aboutEntity == null)
			aboutEntity = new AboutEntity();
		m.addObject("clientPic", aboutEntity);
		m.setViewName("manage/admin-client-changePicture");
		return m;
	}
	
	@RequestMapping(value="saveClientPic", method=RequestMethod.POST)
	public String saveClientPic(
			AboutEntity clientPic,
			@RequestParam(value="clientimg", required=false) MultipartFile clientimg, HttpSession session){
		clientPic.setId(2);
		try {
			aboutService.save(clientPic, clientimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:admin-client-list.html";
	}
	
}
