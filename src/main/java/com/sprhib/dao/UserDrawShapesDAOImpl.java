package com.sprhib.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.UserDrawShapes;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Repository
public class UserDrawShapesDAOImpl implements UserDrawShapesDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public int saveUserDrawings(UserDrawShapes shapes) throws PSQLException, JSONException {
		Serializable sz = getCurrentSession().save(shapes);
		String returnId = sz.toString();
		JSONObject jsonObj = new JSONObject(shapes.getJsonData());
		JSONArray features = jsonObj.getJSONArray("features");
		for(int i=0; i<features.length();i++){
			JSONObject drawing = (JSONObject) features.get(i);
			JSONObject props = drawing.getJSONObject("props");
			props.put("drawingId", Integer.parseInt(returnId));
		}
		shapes.setDrawingId(Integer.parseInt(returnId));
		shapes.setJsonData(jsonObj.toString());
		updateUserDrawings(shapes);
		return Integer.parseInt(returnId);
	}

	@Override
	public boolean updateUserDrawings(UserDrawShapes shapes) throws PSQLException {
		getCurrentSession().update(shapes);
		return true;
	}
	
	@Override
	public List<UserDrawShapes> getUserDrawings(String userId) throws PSQLException {
		Criteria criteria = getCurrentSession().createCriteria(UserDrawShapes.class);
		List<UserDrawShapes> shapes = criteria.add(Restrictions.eq("userId", userId)).list();
		return shapes;
	}

	@Override
	public UserDrawShapes getDrawing(String drawingId) throws PSQLException,
			JSONException {
		Criteria criteria = getCurrentSession().createCriteria(UserDrawShapes.class);
		UserDrawShapes shapes = (UserDrawShapes) criteria.add(Restrictions.eq("drawingid", drawingId));
		return shapes;
	}

}
