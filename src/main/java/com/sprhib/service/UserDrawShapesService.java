package com.sprhib.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.postgresql.util.PSQLException;

import com.sprhib.model.UserDrawShapes;

public interface UserDrawShapesService {
	public int saveUserDrawings(UserDrawShapes shapes) throws JSONException;
	public boolean updateUserDrawings(UserDrawShapes shapes);
	public List<UserDrawShapes> getUserDrawings(String userId);
	public UserDrawShapes getDrawing(String drawingId);
	public ArrayList<UserDrawShapes> getDrawingList(ArrayList<Integer> drawingIdList)
			throws PSQLException, JSONException;
	
	public List<UserDrawShapes> getAllDrawings();
	public boolean deleteDrawings(ArrayList<Integer> drawingIdList) throws PSQLException, JSONException;
	
}
