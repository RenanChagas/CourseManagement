package com.course.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.course.model.Team;
import com.course.model.User;
import com.course.service.DepartmentService;
import com.course.service.TeamService;
import com.course.service.UserService;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	TeamService teamService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	DepartmentService departmentService;
	
	@ModelAttribute("user")
	public User getUserName() {
		return userService.findByUsername(getPrincipal());
	}
	
	@RequestMapping
	public String list(Model model){
		model.addAttribute("teams", teamService.findTeamByUser(getUserName().getId()));
		return "team";
	}
	
	@RequestMapping(value = "/addTeam", method = RequestMethod.GET)
	public String newTeam(ModelMap model) {
		
		Team team = new Team();
		model.addAttribute("team", team);
		
		return "addteam";
	}
	
	@RequestMapping(value = "/addTeam", method = RequestMethod.POST)
	public String newUser(@Valid Team team,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "addteam";
		}
		teamService.save(team);

		return "welcome";
	}
	
	@RequestMapping("removeUserTeam")
	public void removeUserTeam(int id, HttpServletResponse response){
		User user = getUserName();
		userService.removeUserTeam(user, id);
		//userService.deleteTeam();
		response.setStatus(200);
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
