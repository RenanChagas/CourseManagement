package com.course.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.TeamDao;
import com.course.model.Team;
import com.course.service.TeamService;

@Service("TeamService")
@Transactional
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamDao dao;
	
	public Team findById(int id){
		return dao.findById(id);
	}

	public Team findByTeamName(String teamName){
		return dao.findByTeamName(teamName);
	}

	@Override
	public List<Team> findAllByOrderByIdAsc() {
		return dao.findAllByOrderByIdAsc();
	}

}
