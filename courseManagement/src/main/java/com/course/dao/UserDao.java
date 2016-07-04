package com.course.dao;

import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.course.model.User;

@Repository("UserDao")
public interface UserDao extends JpaRepository<User, Long> {
	
	public User findByUsername(String username);
	
	public User findById(int id);

}