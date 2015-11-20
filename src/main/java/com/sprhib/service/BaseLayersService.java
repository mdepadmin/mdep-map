package com.sprhib.service;

import java.util.List;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.UserDrawShapes;

public interface BaseLayersService {
	public List<BaseLayer> getBaseLayers(String userId);
}
