package com.course.service;

import com.course.model.User;

public interface UserService{
	
	public void save(User user);
	
	public void update(User user);
	
	public User findById(int id);
	
	public User findByUsername(String username);
	
	public void removeUserTeam(User user, int id);
	
	//public void deleteTeam();
	
}