package com.sprhib.model;

import java.util.ArrayList;

public class GroupsAndSharedDrawings {
	private String userId;
	ArrayList<Groups> userGroups;
	ArrayList<SharedDrawing> memberSharedDrawingsInfo;
	ArrayList<SharedDrawing> groupSharedDrawingsInfo;
	
	private ArrayList<Groups> groupsInfo;
	private ArrayList<UserLogin> usersInfo;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public ArrayList<Groups> getUserGroups() {
		return userGroups;
	}
	public void setUserGroups(ArrayList<Groups> userGroups) {
		this.userGroups = userGroups;
	}
	public ArrayList<SharedDrawing> getMemberSharedDrawingsInfo() {
		return memberSharedDrawingsInfo;
	}
	public void setMemberSharedDrawingsInfo(
			ArrayList<SharedDrawing> memberSharedDrawingsInfo) {
		this.memberSharedDrawingsInfo = memberSharedDrawingsInfo;
	}
	public ArrayList<SharedDrawing> getGroupSharedDrawingsInfo() {
		return groupSharedDrawingsInfo;
	}
	public void setGroupSharedDrawingsInfo(
			ArrayList<SharedDrawing> groupSharedDrawingsInfo) {
		this.groupSharedDrawingsInfo = groupSharedDrawingsInfo;
	}
	public ArrayList<Groups> getGroupsInfo() {
		return groupsInfo;
	}
	public void setGroupsInfo(ArrayList<Groups> groupsInfo) {
		this.groupsInfo = groupsInfo;
	}
	public ArrayList<UserLogin> getUsersInfo() {
		return usersInfo;
	}
	public void setUsersInfo(ArrayList<UserLogin> usersInfo) {
		this.usersInfo = usersInfo;
	}
}
