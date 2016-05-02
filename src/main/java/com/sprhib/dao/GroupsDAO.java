package com.sprhib.dao;

import java.util.ArrayList;

import org.json.JSONException;
import org.postgresql.util.PSQLException;

import com.sprhib.model.Groups;
import com.sprhib.model.Notices;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.UserDrawShapes;

public interface GroupsDAO {
	// user groups and share drawings related methods
	public int saveGroup(Groups group) throws PSQLException, JSONException;
	public boolean updateGroup(Groups group) throws PSQLException;
	public ArrayList<Groups> getUserGroups(String userId) throws PSQLException;
	public UserDrawShapes getDrawing(String groupId) throws PSQLException, JSONException;
	
	public int shareDrawing(SharedDrawing sharedDrawing) throws PSQLException, JSONException;
	public ArrayList<SharedDrawing> getMemberSharedDrawings(String userId) throws PSQLException;
	public ArrayList<SharedDrawing> getGroupSharedDrawings(ArrayList<Groups> groups) throws PSQLException;
	public int sendNotice(Notices notice) throws PSQLException, JSONException;
	public ArrayList<Notices> getNotices() throws PSQLException;
}
