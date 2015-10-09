package com.sprhib.service;

import java.util.List;

import com.sprhib.model.UserDrawShapes;

public interface UserDrawShapesService {
	public boolean saveUserDrawings(UserDrawShapes shapes);
	public boolean updateUserDrawings(UserDrawShapes shapes);
	public List<UserDrawShapes> getUserDrawings(String userId);
}
