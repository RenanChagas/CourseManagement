package com.course.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.course.model.Team;

@Repository("TeamDao")
public interface TeamDao extends JpaRepository<Team, Long> {
	
	public Team findByTeamName(String teamName);
	
	public Team findById(int id);
	
	public List<Team> findAllByOrderByIdAsc();
	
}