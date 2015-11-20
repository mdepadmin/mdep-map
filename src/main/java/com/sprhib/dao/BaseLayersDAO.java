package com.sprhib.dao;

import java.util.List;

import org.json.JSONException;
import org.postgresql.util.PSQLException;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.UserDrawShapes;

public interface BaseLayersDAO {
	public List<BaseLayer> getBaseLayers(String userId) throws PSQLException;
}
