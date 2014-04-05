package com.flamingo.studiostare.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.ClientEntity;
import com.flamingo.studiostare.service.IClientService;

@Controller
public class Client {

	@Autowired
	private IClientService clientService;

	@RequestMapping(value="admin-client-list.html", method = RequestMethod.GET)
	public ModelAndView clientList() {
		ModelAndView m = new ModelAndView();
		ClientEntity clientEntity = new ClientEntity();
		List<ClientEntity> clientList = clientService.getClient(clientEntity);
		if (clientList == null)
			clientList = new ArrayList<ClientEntity>();
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
		ClientEntity clientEntity = clientService.getClientById(clientId);
		m.addObject("client", clientEntity);
		m.setViewName("manage/admin-client-edit");
		return m;
	}
	
	@RequestMapping(value = "saveClient", method = RequestMethod.POST)
	public String savaClient(ClientEntity client, Model model, HttpSession session) {
		return "redirect:admin-client-list.html";
	}
	
}
