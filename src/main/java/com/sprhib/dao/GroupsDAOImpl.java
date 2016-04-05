package com.sprhib.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.Groups;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.UserDrawShapes;

@Repository
public class GroupsDAOImpl implements GroupsDAO{

	
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private EntityManagerFactory entityManagerFactory;
		
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	// save the group
	@Override
	public int saveGroup(Groups group) throws PSQLException, JSONException {
		getCurrentSession().save(group);
		return 0;
	}

	// update group based on groupId
	@Override
	public boolean updateGroup(Groups group) throws PSQLException {
		// TODO Auto-generated method stub
		return false;
	}

	// get the list of groups user belongs to (based on userId)
	@Override
	public ArrayList<Groups> getUserGroups(String userId) throws PSQLException {

		// get the user groups from groups table
		
		System.out.println("get user groups");
		String queryString = "from Groups as groups where '"+ userId +"' in elements(groups.groupMembers)";
		Query query = getCurrentSession().createQuery(queryString);
		ArrayList<Groups> groups =  (ArrayList<Groups>) query.list();
		for(Groups g: groups){
			System.out.println("id: "+ g.getGroupId());
		}

		// return the list of groups
		return groups;
	}

	@Override
	public UserDrawShapes getDrawing(String groupId) throws PSQLException,
			JSONException {
		// TODO Auto-generated method stub
		return null;
	}


	// save shared drawing to SharedDrawing table (it has mets info of sharing a drawing)
	@Override
	public int shareDrawing(SharedDrawing sharedDrawing) throws PSQLException,
			JSONException {
		getCurrentSession().save(sharedDrawing);
		return 0;
	}
	
	// get the list of drawings shared directly to the user
	@Override
	public ArrayList<SharedDrawing> getMemberSharedDrawings(String userId) throws PSQLException{
		System.out.println("get user shared drawings");
		
		String queryString = "from SharedDrawing as shared where '"+ userId +"' in elements(shared.sharedWithMembers)";
		Query query = getCurrentSession().createQuery(queryString);
		ArrayList<SharedDrawing> sharedMembersDrawings =  (ArrayList<SharedDrawing>) query.list();
		

		for(SharedDrawing draw: sharedMembersDrawings)
			System.out.println(draw.getsharedDrawingId()+" MEMBERS "+draw.getSharedWithMembers());

		return sharedMembersDrawings;
	}
	
	
	// get the list of drawings shared to the groups (groups list is the list of groups user is part of)
	@Override
	public ArrayList<SharedDrawing> getGroupSharedDrawings(ArrayList<Groups> groups) throws PSQLException{
		System.out.println("get user shared drawings");
		
		ArrayList<SharedDrawing> sharedGroupDrawings = new ArrayList<SharedDrawing>();

		// get the shared drawings for each group and add it to a list to return
		for(Groups g: groups){
			String queryString = "from SharedDrawing as shared where "+ g.getGroupId()+" in elements(shared.sharedWithGroups)";
			Query query = getCurrentSession().createQuery(queryString);
			// sharedGroupDrawings =  (ArrayList<SharedDrawing>) query.list();
			ArrayList<SharedDrawing> drawingsList = (ArrayList<SharedDrawing>) query.list();
			sharedGroupDrawings.addAll(drawingsList);
		}

		for(SharedDrawing draw: sharedGroupDrawings)
			System.out.println(draw.getsharedDrawingId()+" GROUPS  "+draw.getSharedWithGroups());

		// return all the drawings shared to given groups
		return sharedGroupDrawings;
	}
	
}
