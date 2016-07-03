package com.course.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.course.model.User;
import com.course.model.UserProfile;
import com.course.service.UserProfileService;
import com.course.service.UserService;

@Controller
public class AccessController {
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	UserService userService;
	
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}
	
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.addAttribute("greeting", "Hi, Welcome to mysite");
		return "welcome";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(ModelMap model) {
		return "accessDenied";
	}
	
	@RequestMapping(value = "/admin/newUser", method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "newuser";
	}
	
	@RequestMapping(value = "/admin/newUser", method = RequestMethod.POST)
	public String newUser(@Valid User user,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "newuser";
		}
		userService.save(user);

		return "redirect:/admin/newUser?confirmation";
	}
	
	
}
