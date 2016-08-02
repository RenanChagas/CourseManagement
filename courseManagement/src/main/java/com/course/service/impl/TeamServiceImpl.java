package com.course.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.TeamDao;
import com.course.dao.UserDao;
import com.course.model.Team;
import com.course.model.User;
import com.course.service.TeamService;

@Service("TeamService")
@Transactional
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamDao dao;
	
	@Autowired
	private UserDao userDao;
	
	public Team findById(int id){
		return dao.findById(id);
	}

	public Team findByTeamName(String teamName){
		return dao.findByTeamName(teamName);
	}

	public List<Team> findAllByOrderByIdAsc() {
		return dao.findAllByOrderByIdAsc();
	}

	public List<Team> findTeamByUser(int id){
		List<Team> teams = new ArrayList<Team>();
		User user = userDao.findById(id);
		for (Team team : user.getTeams()){
			teams.add(team);
		}
		return teams;
	}

}
