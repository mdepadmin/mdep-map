package com.sprhib.service;

import java.util.ArrayList;
import java.util.List;

import org.postgresql.util.PSQLException;

import com.sprhib.model.UserLogin;

public interface UserLoginService {
	
	public UserLogin getUser(String id);
	public List<UserLogin> getUserList() throws PSQLException;
	public boolean createUser(UserLogin newuser) throws PSQLException;
	public boolean deleteUsers(ArrayList<String> userIdList) throws PSQLException;
}
