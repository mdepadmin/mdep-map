package com.sprhib.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.UserDrawShapesDAO;
import com.sprhib.model.UserDrawShapes;

@Service
@Transactional
public class UserDrawShapesServiceImpl implements UserDrawShapesService {

	
	@Autowired
	private UserDrawShapesDAO shapesDAO;

	@Override
	public int saveUserDrawings(UserDrawShapes shapes) throws JSONException {
		try {
			return shapesDAO.saveUserDrawings(shapes);
		} catch (PSQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean updateUserDrawings(UserDrawShapes shapes) {
		try {
			return shapesDAO.updateUserDrawings(shapes);
		} catch (PSQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<UserDrawShapes> getUserDrawings(String userId) {
		try {
			return shapesDAO.getUserDrawings(userId);
		} catch (PSQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public UserDrawShapes getDrawing(String drawingId) {
		try {
			return shapesDAO.getDrawing(drawingId);
		} catch (PSQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public ArrayList<UserDrawShapes> getDrawingList(
			ArrayList<Integer> drawingIdList) throws PSQLException,
			JSONException {

		return shapesDAO.getDrawingList(drawingIdList);
	}

	
	


}
