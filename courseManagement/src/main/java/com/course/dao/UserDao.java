package com.course.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.course.model.User;

@Repository("UserDao")
public interface UserDao extends JpaRepository<User, Long> {

	public User findBySsoId(String sso);
	
	public User findById(int id);

}