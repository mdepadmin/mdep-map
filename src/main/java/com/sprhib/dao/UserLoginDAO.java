package com.sprhib.dao;

import java.util.List;

import org.postgresql.util.PSQLException;

import com.sprhib.model.UserLogin;

public interface UserLoginDAO {

	public UserLogin getUser(String userId) throws PSQLException;
	public List<UserLogin> getUserList() throws PSQLException;
}
