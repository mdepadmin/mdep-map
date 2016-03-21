package com.sprhib.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="UserDrawShapes")
public class UserDrawShapes {
	@Id
	@GeneratedValue
	private Integer drawingId;
	private String userId;
	private String drawingName;
	private String jsonData;
	private String jsonCenter;
	private Integer zoomLevel;
	private Timestamp insertedTime;
	private Integer deleted;
	
	
	public Integer getDrawingId() {
		return drawingId;
	}
	public void setDrawingId(Integer drawingId) {
		this.drawingId = drawingId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDrawingName() {
		return drawingName;
	}
	public void setDrawingName(String drawingName) {
		this.drawingName = drawingName;
	}
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
	public String getJsonCenter() {
		return jsonCenter;
	}
	public void setJsonCenter(String jsonCenter) {
		this.jsonCenter = jsonCenter;
	}
	public Integer getZoomLevel() {
		return zoomLevel;
	}
	public void setZoomLevel(Integer zoomLevel) {
		this.zoomLevel = zoomLevel;
	}
	public Timestamp getInsertedTime() {
		return insertedTime;
	}
	public void setInsertedTime(Timestamp insertedTime) {
		this.insertedTime = insertedTime;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
}
