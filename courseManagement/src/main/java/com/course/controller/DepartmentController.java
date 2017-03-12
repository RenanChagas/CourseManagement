package com.course.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.course.model.Department;
import com.course.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping
	public String list(Model model){
		model.addAttribute("departments", departmentService.findAllByOrderByIdAsc());
		return "departments";
	}
	
	@RequestMapping(value = "/addDepartment", method = RequestMethod.GET)
	public String newDepartment(ModelMap model) {
		
		Department department = new Department();
		model.addAttribute("department", department);
		
		return "addDepartment";
	}
	
	@RequestMapping(value = "/addDepartment", method = RequestMethod.POST)
	public String newDepartment(@Valid Department department,
			BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "addDepartment";
		}
		departmentService.save(department);

		return "welcome";
	}
	
	

}
