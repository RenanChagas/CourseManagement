package com.course.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.course.model.User;
import com.course.model.UserProfile;

@Repository("UserProfileDao")
public interface UserProfileDao extends JpaRepository<UserProfile, Long>{

	
	public List<UserProfile> findAll();
	
	public UserProfile findById(int id);
	
	public UserProfile findByType(String type);
	
	/*
	@SuppressWarnings("unchecked")
	public List<UserProfile> findAll(){
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("type"));
		return (List<UserProfile>)crit.list();
	}
	
	public UserProfile findById(int id) {
		return getByKey(id);
	}
	
	public UserProfile findByType(String type) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("type", type));
		return (UserProfile) crit.uniqueResult();
	}
	*/
}