package com.sprhib.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.SharedDrawing;
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

	@Override
	public ArrayList<UserDrawShapes> getDrawingList(ArrayList<Integer> drawingIdList)
			throws PSQLException, JSONException {
		
		int[] array = new int[drawingIdList.size()];
		for(int i=0;i<drawingIdList.size();i++)
			array[i] = drawingIdList.get(i);
		String queryString = "from UserDrawShapes as shapes where shapes.drawingId IN :idList";
		Query query = getCurrentSession().createQuery(queryString);
		query.setParameterList("idList", drawingIdList);
		ArrayList<UserDrawShapes> drawingsList =  (ArrayList<UserDrawShapes>) query.list();

		return drawingsList;
	}

}
