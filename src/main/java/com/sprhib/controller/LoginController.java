package com.sprhib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sprhib.model.UserLogin;
import com.sprhib.service.UserLoginService;

// Controller for all user access related methods

@Controller
@RequestMapping(value="/logincontroller")
public class LoginController {
	
	@Autowired
	private UserLoginService loginService;
		

	// user login: get the credentials with POST method as 'user' object
	@RequestMapping(value="/login", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public UserLogin userLogin(@RequestBody UserLogin user, HttpServletRequest request) {
		
		boolean message = false;
		
		// get the current session
		HttpSession session = request.getSession();
		
		// get the user details from DB based on userId field 
		UserLogin regUser =	loginService.getUser(user.getUserId());
		session.setAttribute("userId", null);
		
		if(regUser!=null){
			
			// check password
			if(user.getPassword().equals(regUser.getPassword())){
				
				// successful login and save the userId in session
				message = true;
				session.setAttribute("userId", user.getUserId());
				System.out.println("user logged in "+session.getAttribute("userId"));
			}
		}
		// login failed
		if(message){
			regUser.setPassword(null);
			return regUser;
		}else{
			return null;
		}
	}
	
	
	// logout request
	@RequestMapping(value="/logout", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean logout(HttpSession session) {
		
		// removing the user from the session
		session.setAttribute("userId", null);
		System.out.println("user log out");
		return true;
	}
	
	
	
	// get the user list who are using this application
	@RequestMapping(value="/getUsersList", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<UserLogin> getUsersList(HttpServletRequest request) throws PSQLException {
		
		System.out.println("In Login Controller - getUsersList");
		List<UserLogin> userList = null;
		
		// get userId, userType (admin or user) of all users 
		userList =	loginService.getUserList();
		return userList;
	}
	
}
