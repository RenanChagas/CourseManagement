package com.course.service;

import java.util.List;

import com.course.model.Team;

public interface TeamService {
	
	public Team findById(int id);

	public Team findByTeamName(String teamName);
	
	public List<Team> findAllByOrderByIdAsc();
}
