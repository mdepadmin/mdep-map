package com.sprhib.model;

import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="SharedDrawing")
public class SharedDrawing {
	
	@Id
	private int sharedDrawingId;
	@GeneratedValue
	private int sharingId;
	private String sharedByUser;
	
	@ElementCollection
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Integer> sharedWithGroups;
	
	@ElementCollection
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<String> sharedWithMembers;
	
/*	@Column(name = "sharedTime", columnDefinition = "timestampt with time zone not null DEFAULT CURRENT_TIMESTAMP")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date sharedTime;*/
	
	public String getSharedByUser() {
		return sharedByUser;
	}
	public void setSharedByUser(String sharedByUser) {
		this.sharedByUser = sharedByUser;
	}
	public int getsharedDrawingId() {
		return sharedDrawingId;
	}
	public void setsharedDrawingId(int sharedDrawingId) {
		this.sharedDrawingId = sharedDrawingId;
	}
	public List<Integer> getSharedWithGroups() {
		return sharedWithGroups;
	}
	public void setSharedWithGroups(List<Integer> sharedWithGroups) {
		this.sharedWithGroups = sharedWithGroups;
	}
	public List<String> getSharedWithMembers() {
		return sharedWithMembers;
	}
	public void setSharedWithMembers(List<String> sharedWithMembers) {
		this.sharedWithMembers = sharedWithMembers;
	}
	public int getSharingId() {
		return sharingId;
	}
	public void setSharingId(int sharingId) {
		this.sharingId = sharingId;
	}
/*	public Date getSharedTime() {
		return sharedTime;
	}
	public void setSharedTime(Date sharedTime) {
		this.sharedTime = sharedTime;
	}*/
}
