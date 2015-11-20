package com.sprhib.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.BaseLayer;

@Repository
public class BaseLayersDAOImpl implements BaseLayersDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<BaseLayer> getBaseLayers(String userId) throws PSQLException {
		List<BaseLayer> shapes = getCurrentSession().createCriteria(BaseLayer.class).list();
		return shapes;
	}

}
