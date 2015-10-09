package com.sprhib.dao;

import org.postgresql.util.PSQLException;

import com.sprhib.model.UserLogin;

public interface UserLoginDAO {

	public UserLogin getUser(String userId) throws PSQLException;
}
