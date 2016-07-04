package com.course.service;

import com.course.model.User;

public interface UserService{
	
	public void save(User user);
	
	public User findById(int id);
	
	public User findBySsoId(String sso);
	
}