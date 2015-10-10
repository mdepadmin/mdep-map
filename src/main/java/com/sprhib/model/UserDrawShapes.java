package com.sprhib.model;

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
	private String jsonData;
	private String jsonCenter;
	private Integer zoomLevel;
	
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
}
