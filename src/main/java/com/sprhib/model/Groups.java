package com.sprhib.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name="groups")
public class Groups {
	@Id
	@GeneratedValue
	public int groupId;
	@Column(name = "groupName",unique=true)
	public String groupName;
	public String adminId;
	public String groupMembersJSON;
	
	@ElementCollection
	@LazyCollection(LazyCollectionOption.FALSE)
	public List<String> groupMembers;
	
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getGroupMembersJSON() {
		return groupMembersJSON;
	}
	public void setGroupMembersJSON(String groupMembersJSON) {
		this.groupMembersJSON = groupMembersJSON;
	}
	public List<String> getGroupMembers() {
		return groupMembers;
	}
	public void setGroupMembers(List<String> groupMembers) {
		this.groupMembers = groupMembers;
	}
	
}
