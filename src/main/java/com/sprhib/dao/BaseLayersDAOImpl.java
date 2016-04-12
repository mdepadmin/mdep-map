package com.sprhib.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.UserDrawShapes;

@Repository
public class BaseLayersDAOImpl implements BaseLayersDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	// get the list of base layers available in BaseLayer table
	@Override
	public List<BaseLayer> getBaseLayers(String userId, String siteId) throws PSQLException {
		List<BaseLayer> layers = null;

		if(siteId != null){
			Criteria criteria = getCurrentSession().createCriteria(BaseLayer.class);
			layers = criteria.add(Restrictions.eq("siteId", siteId)).list();
//			shapes = getCurrentSession().createCriteria(BaseLayer.class).list();
		}

		return layers;
	}

	@Override
	public boolean saveBaseLayer(BaseLayer baseLayer) {
		try{
			getCurrentSession().save(baseLayer);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
