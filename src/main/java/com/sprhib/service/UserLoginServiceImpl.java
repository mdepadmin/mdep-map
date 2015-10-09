package com.sprhib.service;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.UserLoginDAO;
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

}
