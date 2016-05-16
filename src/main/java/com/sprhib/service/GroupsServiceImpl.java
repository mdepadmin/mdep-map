package com.sprhib.service;

import java.util.ArrayList;

import org.json.JSONException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.GroupsDAO;
import com.sprhib.model.Groups;
import com.sprhib.model.InfoContent;
import com.sprhib.model.Notices;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.UserDrawShapes;

@Service
@Transactional
public class GroupsServiceImpl implements GroupsService {

	
	@Autowired
	private GroupsDAO groupsDAO;
	
	@Override
	public int saveGroup(Groups group) throws PSQLException, JSONException {
		groupsDAO.saveGroup(group);
		return 0;
	}

	@Override
	public boolean updateGroup(Groups group) throws PSQLException {
		groupsDAO.updateGroup(group);
		return false;
	}

	@Override
	public ArrayList<Groups> getUserGroups(String userId) throws PSQLException {
		return groupsDAO.getUserGroups(userId);
	}

	@Override
	public UserDrawShapes getDrawing(String drawingId) {
		try {
			return groupsDAO.getDrawing(drawingId);
		} catch (PSQLException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int shareDrawing(SharedDrawing sharedDrawing) throws PSQLException,
			JSONException {
		groupsDAO.shareDrawing(sharedDrawing);
		return 0;
	}


	@Override
	public ArrayList<SharedDrawing> getMemberSharedDrawings(String userId)
			throws PSQLException {
		return groupsDAO.getMemberSharedDrawings(userId);
	}

	@Override
	public ArrayList<SharedDrawing> getGroupSharedDrawings(
			ArrayList<Groups> groups) throws PSQLException {
			return groupsDAO.getGroupSharedDrawings(groups);
	}

	@Override
	public int sendNotice(Notices notice) throws PSQLException, JSONException {
		return groupsDAO.sendNotice(notice);
	}

	@Override
	public ArrayList<Notices> getNotices() throws PSQLException {
		return groupsDAO.getNotices();
	}

	@Override
	public int updateInfoContent(InfoContent infoContent) throws PSQLException,
			JSONException {
		return groupsDAO.updateInfoContent(infoContent);
	}

	@Override
	public InfoContent getInfoContent() throws PSQLException {
		return groupsDAO.getInfoContent();
	}
	
}
