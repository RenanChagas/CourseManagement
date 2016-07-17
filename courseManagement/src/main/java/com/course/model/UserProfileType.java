package com.course.model;

public enum UserProfileType {
	USER("User"),
	ADMIN("Admin"),
	MANAGER("Manager");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}