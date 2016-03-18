package com.sprhib.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
	
	// get the user details based on userId and return it
	public UserLogin getUser(String userId) throws PSQLException{
		UserLogin user = (UserLogin) getCurrentSession().get(UserLogin.class, userId);
		return user;
	}

	// get the list of users (added by admin)
	@Override
	public List<UserLogin> getUserList() throws PSQLException {
		
		Criteria cr = getCurrentSession().createCriteria(UserLogin.class)
			    .setProjection(Projections.projectionList()
			      .add(Projections.property("userId"), "userId")
			      .add(Projections.property("userType"), "userType"))
			    .setResultTransformer(Transformers.aliasToBean(UserLogin.class));
		
		List<UserLogin> list = cr.add(Restrictions.eq("deleted", 0)).list();
		
		//List<UserLogin> userList = getCurrentSession().createCriteria(UserLogin.class).list();
		return list;
	}

	@Override
	public boolean createUser(UserLogin newuser) throws PSQLException {
		try{
			getCurrentSession().save(newuser);
			return true;
		}catch(Exception e){
			return false;
		}
	}

	@Override
	public boolean deleteUsers(ArrayList<String> userIdList) throws PSQLException {
		
		for(String userId : userIdList){
			UserLogin user = getUser(userId);
			user.setDeleted(1);
			getCurrentSession().update(user);
		}
		return true;
	}
	
	
}
