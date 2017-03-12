package com.course.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.course.model.Department;

@Repository("DepartmentDao")
public interface DepartmentDao extends JpaRepository<Department, Long> {
	
	public Department findByName(String name);
	
	public Department findById(int id);
	
	public List<Department> findAllByOrderByIdAsc();

}
