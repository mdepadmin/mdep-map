package com.sprhib.dao;

import java.util.ArrayList;
import java.util.List;

import org.postgresql.util.PSQLException;

import com.sprhib.model.UserLogin;

public interface UserLoginDAO {
	// user login related methods
	public UserLogin getUser(String userId) throws PSQLException;
	public List<UserLogin> getUserList() throws PSQLException;
	public ArrayList<UserLogin> getUserList(ArrayList<String> userIdList) throws PSQLException;
	public boolean createUser(UserLogin newuser) throws PSQLException;
	public boolean deleteUsers(ArrayList<String> userIdList) throws PSQLException;
}
