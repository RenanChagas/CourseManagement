package com.course.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.dao.DepartmentDao;
import com.course.model.Department;
import com.course.service.DepartmentService;

@Service("DepartmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	private DepartmentDao dao;

	public Department findById(int id) {
		return dao.findById(id);
	}

	public Department findByName(String name) {
		return dao.findByName(name);
	}

	public List<Department> findAllByOrderByIdAsc() {
		return dao.findAllByOrderByIdAsc();
	}

	public void save(Department department) {
		dao.save(department);
		
	}

}
