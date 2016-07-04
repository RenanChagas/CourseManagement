package com.course.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.UserDao;
import com.course.model.User;
import com.course.service.UserService;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	public void save(User user){
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao.save(user);
	}
	
	public User findById(int id){
		return dao.findById(id);
	}

	@Override
	public User findBySsoId(String sso) {
		return dao.findBySsoId(sso);
	}

	

}