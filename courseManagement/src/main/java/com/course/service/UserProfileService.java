package com.course.service;

import java.util.List;

import com.course.model.UserProfile;

public interface UserProfileService {
	
	public List<UserProfile> findAll();

	public UserProfile findByType(String type);

	public UserProfile findById(int id);
}