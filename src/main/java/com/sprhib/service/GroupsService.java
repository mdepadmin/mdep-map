package com.sprhib.service;

import java.util.ArrayList;

import org.json.JSONException;
import org.postgresql.util.PSQLException;

import com.sprhib.model.Groups;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.UserDrawShapes;

public interface GroupsService {
	public int saveGroup(Groups group) throws PSQLException, JSONException;
	public boolean updateGroup(Groups group) throws PSQLException;
	public ArrayList<Groups> getUserGroups(String userId) throws PSQLException;
	public UserDrawShapes getDrawing(String groupId) throws PSQLException, JSONException;
	
	public int shareDrawing(SharedDrawing sharedDrawing) throws PSQLException, JSONException;
	public ArrayList<SharedDrawing> getMemberSharedDrawings(String userId) throws PSQLException;
	public ArrayList<SharedDrawing> getGroupSharedDrawings(ArrayList<Groups> groups) throws PSQLException;
}