package com.sprhib.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.UserDrawShapes;

@Repository
public class UserDrawShapesDAOImpl implements UserDrawShapesDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public boolean saveUserDrawings(UserDrawShapes shapes) throws PSQLException {
		getCurrentSession().save(shapes);
		return true;
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

}
