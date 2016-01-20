package com.sprhib.dao;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.postgresql.util.PSQLException;

import com.sprhib.model.UserDrawShapes;

public interface UserDrawShapesDAO {
	// user drawings related methods
	public int saveUserDrawings(UserDrawShapes shapes) throws PSQLException, JSONException;
	public boolean updateUserDrawings(UserDrawShapes shapes) throws PSQLException;
	public List<UserDrawShapes> getUserDrawings(String userId) throws PSQLException;
	public UserDrawShapes getDrawing(String drawingId) throws PSQLException, JSONException;
	public ArrayList<UserDrawShapes> getDrawingList(ArrayList<Integer> drawingIdList) throws PSQLException, JSONException;
}
