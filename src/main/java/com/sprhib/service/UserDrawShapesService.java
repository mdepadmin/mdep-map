package com.sprhib.service;

import java.util.List;

import org.json.JSONException;

import com.sprhib.model.UserDrawShapes;

public interface UserDrawShapesService {
	public int saveUserDrawings(UserDrawShapes shapes) throws JSONException;
	public boolean updateUserDrawings(UserDrawShapes shapes);
	public List<UserDrawShapes> getUserDrawings(String userId);
	public UserDrawShapes getDrawing(String drawingId);
}
