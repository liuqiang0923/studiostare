package com.flamingo.studiostare.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flamingo.studiostare.entity.UserEntity;
import com.flamingo.studiostare.mail.MailSenderInfo;
import com.flamingo.studiostare.mail.SimpleMailSender;
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
		// set session
		session.setAttribute("userid", 1);
		return "redirect:admin-video-list.html";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userid");
		return "manage/admin-login";
	}
	
	@RequestMapping(value="resetPassword", method=RequestMethod.POST)
	public String resetPassword(UserEntity user, HttpSession session) {
		if(user.getEmail() == null)
			return "redirect:admin-login.html";
		UserEntity admin = userService.getById(1);
		if(admin.getEmail().trim().equals(user.getEmail().trim())){
			String password = org.apache.commons.lang.RandomStringUtils.random(6,"1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM");
			admin.setPassword(password);
			try{
				userService.save(admin, null);
				MailSenderInfo mailInfo = new MailSenderInfo();
				mailInfo.setMailServerHost("smtp.163.com");
				mailInfo.setMailServerPort("25");
				mailInfo.setValidate(true);
				mailInfo.setUserName("zowie_chen@163.com");
				mailInfo.setPassword("zowie1121");
				mailInfo.setFromAddress("zowie_chen@163.com");
				mailInfo.setToAddress(admin.getEmail().trim());
				mailInfo.setSubject("reset studiostare admin password");
				mailInfo.setContent("dear studiostare admin, your account is : " + admin.getName() + ", new password is :" + admin.getPassword());
				SimpleMailSender sms = new SimpleMailSender();
				sms.sendHtmlMail(mailInfo);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:admin-login.html";
	}
	
}
