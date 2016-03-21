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
import com.sprhib.model.UserLogin;

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
	
	// save drawing (includes shapes, zoom level, center etc) to UserDrawShapes table 
	@Override
	public int saveUserDrawings(UserDrawShapes shapes) throws PSQLException, JSONException {
		// save the drawing
		Serializable sz = getCurrentSession().save(shapes);
		
		// get the id of this drawing which is saved just now
		String returnId = sz.toString();
		JSONObject jsonObj = new JSONObject(shapes.getJsonData());
		JSONArray features = jsonObj.getJSONArray("features");
		// add this id to props
		for(int i=0; i<features.length();i++){
			JSONObject drawing = (JSONObject) features.get(i);
			JSONObject props = drawing.getJSONObject("props");
			props.put("drawingId", Integer.parseInt(returnId));
		}
		shapes.setDrawingId(Integer.parseInt(returnId));
		shapes.setJsonData(jsonObj.toString());
		// update it with the id
		updateUserDrawings(shapes);
		return Integer.parseInt(returnId);
	}

	// update the drawing (shapes object)
	@Override
	public boolean updateUserDrawings(UserDrawShapes shapes) throws PSQLException {
		getCurrentSession().update(shapes);
		return true;
	}
	
	// get the list of drawings saved by the user from UserDrawShapes table 
	@Override
	public List<UserDrawShapes> getUserDrawings(String userId) throws PSQLException {
		Criteria criteria = getCurrentSession().createCriteria(UserDrawShapes.class);
		List<UserDrawShapes> shapes = criteria.add(Restrictions.eq("userId", userId)).list();
		return shapes;
	}

	// get drawing based for a given drawingId
	@Override
	public UserDrawShapes getDrawing(String drawingId) throws PSQLException,
			JSONException {
		System.out.println(drawingId);
		//Criteria criteria = getCurrentSession().createCriteria(UserDrawShapes.class);
		//UserDrawShapes shapes = (UserDrawShapes) criteria.add(Restrictions.eq("drawingid", drawingId));
		
		UserDrawShapes shapes = (UserDrawShapes) getCurrentSession().get(UserDrawShapes.class, Integer.parseInt(drawingId));

		
		return shapes;
	}

	// get the drawings based on ids
	@Override
	public ArrayList<UserDrawShapes> getDrawingList(ArrayList<Integer> drawingIdList)
			throws PSQLException, JSONException {
		
//		int[] array = new int[drawingIdList.size()];
//		for(int i=0;i<drawingIdList.size();i++)
//			array[i] = drawingIdList.get(i);
		
		// idList is a dummy parameter which should contain the list of drawing Ids 
		String queryString = "from UserDrawShapes as shapes where shapes.drawingId IN :idList";
		Query query = getCurrentSession().createQuery(queryString);
		query.setParameterList("idList", drawingIdList);
		ArrayList<UserDrawShapes> drawingsList =  (ArrayList<UserDrawShapes>) query.list();

		return drawingsList;
	}

	@Override
	public List<UserDrawShapes> getAllDrawings() throws PSQLException {
		Criteria criteria = getCurrentSession().createCriteria(UserDrawShapes.class);
		List<UserDrawShapes> shapes = criteria.add(Restrictions.eq("deleted", 0)).list();
		return shapes;
	}

	@Override
	public boolean deleteDrawings(ArrayList<Integer> drawingIdList) throws PSQLException, JSONException {
		System.out.println("deleting "+drawingIdList);
		for(Integer drawingId : drawingIdList){
			String strId = Integer.toString(drawingId);
			UserDrawShapes shape = getDrawing(strId);
			shape.setDeleted(1);
			// updateUserDrawings(shape);
			getCurrentSession().update(shape);
		}
		
		return true;
	}

}
