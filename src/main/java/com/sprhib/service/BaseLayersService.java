package com.sprhib.service;

import java.util.List;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.UserDrawShapes;

public interface BaseLayersService {
	// base layers related methods
	public List<BaseLayer> getBaseLayers(String userId, String siteId);
	public boolean saveBaseLayer(BaseLayer baseLayer);
}
