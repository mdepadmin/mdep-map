package com.sprhib.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sprhib.model.Groups;
import com.sprhib.model.GroupsAndSharedDrawings;
import com.sprhib.model.InfoContent;
import com.sprhib.model.Notices;
import com.sprhib.model.SharedDrawing;
import com.sprhib.model.UserLogin;
import com.sprhib.service.GroupsService;
import com.sprhib.service.UserLoginService;

// controller for groups related methods, such as create new group, share drawings etc

@Controller
@RequestMapping(value="/groupscontroller")
public class GroupsController {
	
	@Autowired
	private GroupsService groupsService;
	
	@Autowired
	private UserLoginService loginService;
	
	
	private static final String STATIC_INFO = "This map service provided by the Mojave Desert Ecosystem Program (MDEP).  More can be found about MDEP at <a href='www.mojavedata.gov'> www.mojavedata.gov </a>";
			
	
	// create new group
	@RequestMapping(value="/createNewGroup", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int createNewGroup(@RequestBody Groups group, HttpServletRequest request) throws JSONException, PSQLException {

		// create new group with admin as current user (logged in user)
		int returnId = 0;
		System.out.println("Create new group..! "+group.getGroupMembersJSON());
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		group.setAdminId(userId);
		
		groupsService.saveGroup(group);
		return returnId;
	}
	
	
	// share drawing with members or groups
	
	@RequestMapping(value="/shareDrawing", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int shareDrawing(@RequestBody SharedDrawing sharedDrawing, HttpServletRequest request) throws JSONException, PSQLException {
		
		// get the sharedDrawing object from js, which contains the list of users and groups to share with 
		int returnId = 0;
		System.out.println("Share Drawing..! "+sharedDrawing.getsharedDrawingId());
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		sharedDrawing.setSharedByUser(userId);
		
		// save sharing info 
		groupsService.shareDrawing(sharedDrawing);
		return returnId;
	}
	
	// for share feed, get the list of groups and the drawings shared to those groups
	@RequestMapping(value="/getUserGroupsAndShareDrawings", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public GroupsAndSharedDrawings getUserGroupsAndShareDrawings(HttpServletRequest request) throws JSONException, PSQLException {
		
		// get userid from session
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		// get the list of groups the user belongs to
		ArrayList<Groups> groups = groupsService.getUserGroups(userId);
		System.out.println("Groups Size "+groups.size());
		
		// get the drawings shared with the current user
		ArrayList<SharedDrawing> memberSharedDrawings = groupsService.getMemberSharedDrawings(userId);
		// get the list of drawings shared with the groups the user is part of
		ArrayList<SharedDrawing> groupSharedDrawings = groupsService.getGroupSharedDrawings(groups);

		// add all the shared drawings and groups info to the  groupAndDrawings object to return to js
		GroupsAndSharedDrawings groupAndDrawings = new GroupsAndSharedDrawings();
		groupAndDrawings.setUserId(userId);
		groupAndDrawings.setUserGroups(groups);
		groupAndDrawings.setGroupSharedDrawingsInfo(groupSharedDrawings);
		groupAndDrawings.setMemberSharedDrawingsInfo(memberSharedDrawings);
		
		ArrayList<UserLogin> sharedByUsers = new ArrayList<UserLogin>();
		HashSet<String> uIdSet = new HashSet<String>();
		
		for(SharedDrawing drawing : groupSharedDrawings){
			String uId = drawing.getSharedByUser();
			uIdSet.add(uId);
		}
		
		for(SharedDrawing drawing : memberSharedDrawings){
			String uId = drawing.getSharedByUser();
			uIdSet.add(uId);
		}
		
		
		if(uIdSet.size() > 0){
			ArrayList<String> uIdList = new ArrayList<String>();
			uIdList.addAll(uIdSet);
			sharedByUsers = loginService.getUserList(uIdList);
		}
		groupAndDrawings.setUsersInfo(sharedByUsers);
		return groupAndDrawings;
	}

	
	// create new group
		@RequestMapping(value="/sendNotice", method=RequestMethod.POST, 
				produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public int sendNotice(@RequestBody Notices notice, HttpServletRequest request) throws JSONException, PSQLException {

			int returnId = 0;
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("userId");
			notice.setAuthor(userId);
			
			groupsService.sendNotice(notice);
			return returnId;
		}
		
		// get the notices
		@RequestMapping(value="/getNotices", method=RequestMethod.POST, 
				produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public List<Notices> getNotices(HttpServletRequest request) throws PSQLException {
			
			System.out.println("In Groups Controller - getNotices");
			List<Notices> noticesList = null;
			
			HttpSession session = request.getSession();
			String userType = (String)session.getAttribute("userType");
			
			//if(userType!=null && userType.equals("A"))
			noticesList =	groupsService.getNotices();
			
			return noticesList;
		}
		
		// update info content
		@RequestMapping(value="/updateInfoContent", method=RequestMethod.POST, 
		produces=MediaType.APPLICATION_JSON_VALUE, consumes=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public int updateInfoContent(@RequestBody InfoContent infoContent, HttpServletRequest request) throws JSONException, PSQLException {

			int returnId = 0;
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("userId");
			
			infoContent.setDeleted(0);
			returnId = groupsService.updateInfoContent(infoContent);
			
			return returnId;
		}
		
		// get info content
		@RequestMapping(value="/getInfoContent", method=RequestMethod.POST, 
				produces=MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public InfoContent getInfoContent(HttpServletRequest request) throws PSQLException, JSONException {
			
			System.out.println("In Groups Controller - getInfoContent");
			InfoContent infoContent = null;
			
			HttpSession session = request.getSession();
			String userType = (String)session.getAttribute("userType");
			
			//if(userType!=null && userType.equals("A"))
			infoContent =	groupsService.getInfoContent();
			
			if(infoContent == null){
				infoContent =  new InfoContent();
				infoContent.setDeleted(0);
				infoContent.setInfo(STATIC_INFO);
				groupsService.updateInfoContent(infoContent);
			}
			
			return infoContent;
		}
		
		
}
