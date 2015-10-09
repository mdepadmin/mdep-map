package com.sprhib.dao;

import java.util.List;

import org.postgresql.util.PSQLException;

import com.sprhib.model.UserDrawShapes;

public interface UserDrawShapesDAO {
	public boolean saveUserDrawings(UserDrawShapes shapes) throws PSQLException;
	public boolean updateUserDrawings(UserDrawShapes shapes) throws PSQLException;
	public List<UserDrawShapes> getUserDrawings(String userId) throws PSQLException;
}
