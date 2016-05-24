package com.sprhib.service;

import java.util.ArrayList;
import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.UserLoginDAO;
import com.sprhib.model.SiteProperties;
import com.sprhib.model.UserLogin;

@Service
@Transactional
public class UserLoginServiceImpl implements UserLoginService {
	
	@Autowired
	private UserLoginDAO userLoginDAO;

	@Override
	public UserLogin getUser(String id) {
		try {
			return userLoginDAO.getUser(id);
		} catch (PSQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<UserLogin> getUserList() throws PSQLException {
		return userLoginDAO.getUserList();
	}

	@Override
	public boolean createUser(UserLogin newuser) throws PSQLException {
		
		List<UserLogin> existingUsers = userLoginDAO.getUserList();
		
		for(UserLogin user : existingUsers){
			if(user.getUserId().equals(newuser.getUserId()))
				return false;
		}
		return userLoginDAO.createUser(newuser);
	}

	@Override
	public boolean deleteUsers(ArrayList<String> userIdList) throws PSQLException {
		return userLoginDAO.deleteUsers(userIdList);
	}

	@Override
	public ArrayList<UserLogin> getUserList(ArrayList<String> userIdList) throws PSQLException {
		return userLoginDAO.getUserList(userIdList);
	}

	@Override
	public boolean saveUser(UserLogin user) throws PSQLException {
		return userLoginDAO.saveUser(user);
	}

	@Override
	public SiteProperties getSiteProperties() throws PSQLException {
		return userLoginDAO.getSiteProperties();
	}

	@Override
	public boolean setSiteProperties(SiteProperties properties) throws PSQLException {
		
		return userLoginDAO.setSiteProperties(properties);
	}

}
