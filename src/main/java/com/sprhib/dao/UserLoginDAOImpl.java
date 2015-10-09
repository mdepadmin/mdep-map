package com.sprhib.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
}
