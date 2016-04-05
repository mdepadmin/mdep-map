package com.sprhib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sprhib.model.BaseLayer;
import com.sprhib.service.BaseLayersService;

@Controller
@RequestMapping(value="/baselayerscontroller")
public class BaseLayersController {
	
	@Autowired
	private BaseLayersService baseLayersService;
	
	// get the list of base layers added by admin in the db
	@RequestMapping(value="/getBaseLayers", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<BaseLayer> getBaseLayers(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<BaseLayer> baseLayers = null;
		// call baseLayersService service to get the layers
		baseLayers = baseLayersService.getBaseLayers(userId);
		return baseLayers;
	}	
}
