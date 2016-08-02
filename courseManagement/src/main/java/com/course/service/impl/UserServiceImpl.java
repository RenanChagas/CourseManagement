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

	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	public void update(User user) {
		User userUpdate = dao.findById(user.getId());
		
		userUpdate.setUsername(user.getUsername());
		userUpdate.setFirstName(user.getFirstName());
		userUpdate.setLastName(user.getLastName());
		userUpdate.setEmail(user.getEmail());
		userUpdate.setJobDesc(user.getJobDesc());
		userUpdate.setUserProfiles(user.getUserProfiles());
		
		dao.save(userUpdate);
	}

	public void removeUserTeam(User user, int teamId){
		User userUpdate = dao.findById(user.getId());
		
		userUpdate.getTeams().remove(teamId);
		userUpdate.setTeams(userUpdate.getTeams());
		dao.save(userUpdate);
	}
	
	//public void deleteTeam(){
	//	dao.deleteTeam();
	//}

}
