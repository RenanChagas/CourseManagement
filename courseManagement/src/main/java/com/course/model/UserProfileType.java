package com.course.model;

public enum UserProfileType {
	USER("USER"),
	ADMIN("ADMIN"),
	MANAGER("MANAGER");
	
	String userProfileType;
	
	private UserProfileType(String userProfileType){
		this.userProfileType = userProfileType;
	}
	
	public String getUserProfileType(){
		return userProfileType;
	}
	
}