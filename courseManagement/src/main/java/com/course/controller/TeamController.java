package com.course.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.course.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	TeamService teamService;
	
	@RequestMapping
	public String list(Model model){
		model.addAttribute("teams", teamService.findAllByOrderByIdAsc());
		return "team";
	}
	
	//Team Homepage
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String team() {
		return "team";
	}

}
