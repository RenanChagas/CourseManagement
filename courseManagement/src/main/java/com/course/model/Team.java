package com.course.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="TEAM")
public class Team {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@NotEmpty
	@Column(name="TEAM_NAME", unique=true, nullable=false)
	private String teamName;
	
	@NotEmpty
	@Column(name="TEAM_DESC", unique=true, nullable=false)
	private String teamDesc;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamDesc() {
		return teamDesc;
	}

	public void setTeamDesc(String teamDesc) {
		this.teamDesc = teamDesc;
	}

	@Override
	public String toString() {
		return "Team [id=" + id + ", teamName=" + teamName + ", TeamDesc=" + teamDesc +"]";
	}

}
