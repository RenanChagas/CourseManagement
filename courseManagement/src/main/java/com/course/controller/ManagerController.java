package com.course.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	UserService userService;
	
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAllByOrderByIdAsc();
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		
		User user = new User();
		model.addAttribute("user", user);
		
		return "adduser";
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public String newUser(@Valid User user,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "newuser";
		}
		userService.save(user);

		return "welcome";
	}


}
