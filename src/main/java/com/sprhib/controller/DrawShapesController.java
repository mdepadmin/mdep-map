package com.sprhib.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sprhib.model.BaseLayer;
import com.sprhib.model.Groups;
import com.sprhib.model.GroupsAndSharedDrawings;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.Team;
import com.sprhib.model.UserDrawShapes;
import com.sprhib.model.UserLogin;
import com.sprhib.service.BaseLayersService;
import com.sprhib.service.GroupsService;
import com.sprhib.service.TeamService;
import com.sprhib.service.UserDrawShapesService;
import com.sprhib.service.UserLoginService;


@Controller
@RequestMapping(value="/drawshapescontroller")
public class DrawShapesController {
	
	@Autowired
	private UserDrawShapesService drawShapeService;
	
	// save user drawings
	
	@RequestMapping(value="/saveDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int saveDrawings(@RequestBody UserDrawShapes drawing, HttpServletRequest request) throws JSONException {
		
		// all the shapes (rectangle, line, marker etc), zoom level, center in drawing object
		int returnId = 0;
		System.out.println("Saving drawings..!");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		drawing.setUserId(userId);
		// drawingId will be generated (auto increment column in db)
		drawing.setDrawingId(null);
		drawing.setDeleted(0);

		// saving the drawing
		returnId =	drawShapeService.saveUserDrawings(drawing);
		return returnId;
	}
	
	
	// delete drawings
	@RequestMapping(value="/deleteAllUserDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean deleteDrawings(@RequestBody ArrayList<Integer> drawingIdList, HttpServletRequest request) throws PSQLException, JSONException {
		
		boolean returnMessage = false;

		// soft delete drawings
		
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("userType");
		
		//if(userType.equals("A"))
			returnMessage =	drawShapeService.deleteDrawings(drawingIdList);
		
		return returnMessage;			
	}
		
	// get the list of drawings saved by the user
	
	@RequestMapping(value="/getDrawingsList", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ArrayList<UserDrawShapes> getDrawingsList(@RequestBody ArrayList<Integer> uniqueIds, HttpServletRequest request) throws JSONException, PSQLException {
		
		if(uniqueIds == null || uniqueIds.size()==0)
			return null;
		
		int returnId = 0;
		System.out.println("Share Drawings List ..! "+uniqueIds);
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		// get the drawings from service using the Ids
		return	drawShapeService.getDrawingList(uniqueIds);

	}

	
	
	
	// update existing saved drawing	
	@RequestMapping(value="/updateDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public UserDrawShapes updateDrawings(@RequestBody UserDrawShapes drawing, HttpServletRequest request) {

		boolean result = false;		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		drawing.setUserId(userId);
		
		// drawing object has the updated json shapes, center, zoom level
		result =	drawShapeService.updateUserDrawings(drawing);
		if(result)
			return drawing;
		else
			return null;
	}
	
	
	
	@RequestMapping(value="/getUserDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<UserDrawShapes> getDrawings(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println("In Shapes Controller - getDrawings");
		List<UserDrawShapes> shapes = null;
		if(userId != null)
			shapes =	drawShapeService.getUserDrawings(userId);
		return shapes;
	}
	
	@RequestMapping(value="/getAllDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<UserDrawShapes> getAllDrawings(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("userType");
		List<UserDrawShapes> shapes = null;
		
		System.out.println("In Shapes Controller - getAllDrawings");	
		//if(userType!=null && userType.equals("A"))
			shapes =	drawShapeService.getAllDrawings();
		
		return shapes;
	}
		
	
	// save image files linked with markers
	// get the image using the multipartFile object and save that image by renaming it with current time with original file extension
	@RequestMapping(value = "/savefiles", method = RequestMethod.POST)
	@ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {

        String fileName = multipartFile.getOriginalFilename();
        int lastDot = fileName.lastIndexOf(".");
        String extension = fileName.substring(lastDot);

        // save the image under resources/images/ directory in the project folder, renamed with currenttime (millis)
		HttpSession session = request.getSession();
		String serverDir = session.getServletContext().getRealPath("/");
        String imagesDir = "resources/images/";
        
        String newFileName = imagesDir+ System.currentTimeMillis()+extension;
        
        if (!"".equalsIgnoreCase(fileName))
            multipartFile.transferTo(new File(serverDir+newFileName));
 
        System.out.println("Saving the image to "+serverDir+newFileName);
        
        return newFileName;
    }
	
}
