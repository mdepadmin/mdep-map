package com.sprhib.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.UserLogin;

@Repository
public class UserLoginDAOImpl implements UserLoginDAO {
	

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public UserLogin getUser(String userId) throws PSQLException{
		UserLogin user = (UserLogin) getCurrentSession().get(UserLogin.class, userId);
		return user;
	}

	@Override
	public List<UserLogin> getUserList() throws PSQLException {
		
		Criteria cr = getCurrentSession().createCriteria(UserLogin.class)
			    .setProjection(Projections.projectionList()
			      .add(Projections.property("userId"), "userId")
			      .add(Projections.property("userType"), "userType"))
			    .setResultTransformer(Transformers.aliasToBean(UserLogin.class));

		List<UserLogin> list = cr.list();
		
		//List<UserLogin> userList = getCurrentSession().createCriteria(UserLogin.class).list();
		return list;
	}
}
