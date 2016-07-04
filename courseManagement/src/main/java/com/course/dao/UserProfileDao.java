package com.course.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.course.model.UserProfile;

@Repository("UserProfileDao")
public interface UserProfileDao extends JpaRepository<UserProfile, Long>{

	
	public List<UserProfile> findAll();
	
	public UserProfile findById(int id);
	
	public UserProfile findByType(String type);
	
}