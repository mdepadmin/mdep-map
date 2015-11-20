package com.sprhib.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
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
import com.sprhib.model.Team;
import com.sprhib.model.UserDrawShapes;
import com.sprhib.model.UserLogin;
import com.sprhib.service.BaseLayersService;
import com.sprhib.service.TeamService;
import com.sprhib.service.UserDrawShapesService;
import com.sprhib.service.UserLoginService;

class res{
	String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}

@Controller
@RequestMapping(value="/team")
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	@Autowired
	private UserLoginService loginService;
	@Autowired
	private UserDrawShapesService drawShapeService;
	@Autowired
	private BaseLayersService baseLayersService;

	private static String globalUser = "b";
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addTeamPage() {
		ModelAndView modelAndView = new ModelAndView("add-team-form");
		modelAndView.addObject("team", new Team());
		return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public res addingTeam(@RequestBody Team team) {
		System.out.println("Received data");		
		teamService.addTeam(team);
		
		String message = "Team was successfully added.";
		res r = new res();
		r.message = message;
		return r;
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean userLogin(@RequestBody UserLogin user, HttpServletRequest request) {
		
		boolean message = false;
		
		HttpSession session = request.getSession();
		
		System.out.println("before login user "+session.getAttribute("userId"));
		
		UserLogin regUser =	loginService.getUser(user.getUserId());
		session.setAttribute("userId", null);
		
		if(regUser!=null){
			if(user.getPassword().equals(regUser.getPassword())){
				message = true;
				session.setAttribute("userId", user.getUserId());
				System.out.println("user logged in "+session.getAttribute("userId"));
			}
		}
		return message;
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean logout(HttpSession session) {
		session.setAttribute("userId", null);
		System.out.println("user log out");
		return true;
	}
	
	@RequestMapping(value="/saveDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int saveDrawings(@RequestBody UserDrawShapes drawing, HttpServletRequest request) throws JSONException {
		
		int returnId = 0;
		System.out.println("Saving drawings..!");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		drawing.setUserId(userId);
		//drawing.setUserId(globalUser);
		drawing.setDrawingId(null);
		
		returnId =	drawShapeService.saveUserDrawings(drawing);
		return returnId;
	}
	
	
	@RequestMapping(value="/getBaseLayers", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<BaseLayer> getBaseLayers(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		List<BaseLayer> baseLayers = null;
		baseLayers = baseLayersService.getBaseLayers(userId);
		return baseLayers;
	}
	
	@RequestMapping(value="/updateDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public UserDrawShapes updateDrawings(@RequestBody UserDrawShapes drawing, HttpServletRequest request) {
		System.out.println("Entered update function");
		boolean result = false;
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		drawing.setUserId(userId);
		//drawing.setUserId(globalUser);

		result =	drawShapeService.updateUserDrawings(drawing);
		if(result)
			return drawing;
		else
			return null;
	}
	
	
	
	@RequestMapping(value="/getDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<UserDrawShapes> getDrawings(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println("In Team Controller - getDrawings");
		List<UserDrawShapes> shapes = null;
		shapes =	drawShapeService.getUserDrawings(userId);
		return shapes;
	}
	
	
	
	@RequestMapping(value = "/savefiles", method = RequestMethod.POST)
	@ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {

        String fileName = multipartFile.getOriginalFilename();
        int lastDot = fileName.lastIndexOf(".");
        String extension = fileName.substring(lastDot);

		HttpSession session = request.getSession();
		String serverDir = session.getServletContext().getRealPath("/");
        String imagesDir = "resources/images/";
        
        String newFileName = imagesDir+ System.currentTimeMillis()+extension;
        
        if (!"".equalsIgnoreCase(fileName))
            multipartFile.transferTo(new File(serverDir+newFileName));
 
        return newFileName;
    }
	
	
	
	
	
	
	
	
	@RequestMapping(value="/list")
	public ModelAndView listOfTeams() {
		ModelAndView modelAndView = new ModelAndView("list-of-teams");
		
		List<Team> teams = teamService.getTeams();
		modelAndView.addObject("teams", teams);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editTeamPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-team-form");
		Team team = teamService.getTeam(id);
		modelAndView.addObject("team",team);
		return modelAndView;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
	public ModelAndView edditingTeam(@ModelAttribute Team team, @PathVariable Integer id) {

		ModelAndView modelAndView = new ModelAndView("home");
		
		teamService.updateTeam(team);
		
		String message = "Team was successfully edited.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public ModelAndView deleteTeam(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("home");
		teamService.deleteTeam(id);
		String message = "Team was successfully deleted.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}
	
}
