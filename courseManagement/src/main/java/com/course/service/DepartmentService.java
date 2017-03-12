package com.course.service;

import java.util.List;

import com.course.model.Department;

public interface DepartmentService {
	
	public Department findById(int id);

	public Department findByName(String name);
	
	public List<Department> findAllByOrderByIdAsc();
	
	public void save(Department department);

}
