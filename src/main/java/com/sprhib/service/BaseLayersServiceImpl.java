package com.sprhib.service;

import java.util.List;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.BaseLayersDAO;
import com.sprhib.model.BaseLayer;

@Service
@Transactional
public class BaseLayersServiceImpl implements BaseLayersService {

	
	@Autowired
	private BaseLayersDAO baseLayersDAO;

	
	@Override
	public List<BaseLayer> getBaseLayers(String userId) {
		try {
			return baseLayersDAO.getBaseLayers(userId);
		} catch (PSQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	


}
