package com.course.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;

import com.course.model.User;
import com.course.service.TeamService;
import com.course.service.UserService;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	TeamService teamService;
	
	@Autowired
	UserService userService;
	
	@ModelAttribute("user")
	public User getUserName() {
		return userService.findByUsername(getPrincipal());
	}
	
	@RequestMapping
	public String list(Model model){
		model.addAttribute("teams", teamService.findTeamByUser(getUserName().getId()));
		return "team";
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
