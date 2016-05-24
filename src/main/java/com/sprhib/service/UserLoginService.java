package com.sprhib.service;

import java.util.ArrayList;
import java.util.List;

import org.postgresql.util.PSQLException;

import com.sprhib.model.SiteProperties;
import com.sprhib.model.UserLogin;

public interface UserLoginService {
	
	public UserLogin getUser(String id);
	public List<UserLogin> getUserList() throws PSQLException;
	public ArrayList<UserLogin> getUserList(ArrayList<String> userIdList) throws PSQLException;
	public boolean createUser(UserLogin newuser) throws PSQLException;
	public boolean saveUser(UserLogin user) throws PSQLException;
	public boolean deleteUsers(ArrayList<String> userIdList) throws PSQLException;
	public SiteProperties getSiteProperties()  throws PSQLException;
	public boolean setSiteProperties(SiteProperties properties)  throws PSQLException;
}
