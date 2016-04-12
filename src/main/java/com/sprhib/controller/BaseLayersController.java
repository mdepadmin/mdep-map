package com.sprhib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.UserDrawShapes;
import com.sprhib.service.BaseLayersService;

@Controller
@RequestMapping(value="/baselayerscontroller")
public class BaseLayersController {
	
	@Autowired
	private BaseLayersService baseLayersService;
	
	// get the list of base layers added by admin in the db
	@RequestMapping(value="/getBaseLayers", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<BaseLayer> getBaseLayers(@RequestBody BaseLayer base, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<BaseLayer> baseLayers = null;
		// call baseLayersService service to get the layers
		baseLayers = baseLayersService.getBaseLayers(userId, base.getSiteId());
		return baseLayers;
	}
	
	
	
	@RequestMapping(value="/addBaseLayer", method=RequestMethod.POST, 
	produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public BaseLayer addBaseLayer(@RequestBody BaseLayer baseLayer, HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");

		boolean returnMessage = false;
		returnMessage = baseLayersService.saveBaseLayer(baseLayer);
		if(returnMessage)
			return baseLayer;
		return null;
	}

}
