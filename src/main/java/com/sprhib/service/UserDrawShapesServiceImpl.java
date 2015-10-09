package com.sprhib.service;

import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.UserDrawShapesDAO;
import com.sprhib.model.UserDrawShapes;

@Service
@Transactional
public class UserDrawShapesServiceImpl implements UserDrawShapesService {

	
	@Autowired
	private UserDrawShapesDAO shapesDAO;

	@Override
	public boolean saveUserDrawings(UserDrawShapes shapes) {
		try {
			return shapesDAO.saveUserDrawings(shapes);
		} catch (PSQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean updateUserDrawings(UserDrawShapes shapes) {
		try {
			return shapesDAO.updateUserDrawings(shapes);
		} catch (PSQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<UserDrawShapes> getUserDrawings(String userId) {
		try {
			return shapesDAO.getUserDrawings(userId);
		} catch (PSQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	


}
