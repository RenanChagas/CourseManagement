package com.course.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="DEPARTMENT")
public class Department {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty
	@Column(name="NAME", unique=true, nullable=false)
	private String name;
	
	@NotEmpty
	@Column(name="DESC", unique=true, nullable=false)
	private String desc;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getDesc(){
		return desc;
	}
	
	public void setDesc(String desc){
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return "DEPARTMENT [id=" + id + ", name=" + name + ", desc=" + desc +"]";
	}

}
