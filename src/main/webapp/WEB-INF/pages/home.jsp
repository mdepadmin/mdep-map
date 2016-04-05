<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <title>UI Home page</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <!-- Bootstrap 3.3.5 -->    
    <link rel="stylesheet" href="<spring:url value="/resources/UI/bootstrap/css/bootstrap.min.css"/>"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<spring:url value="/resources/UI/dist/css/AdminLTE.css"/>">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="<spring:url value="/resources/UI/dist/css/skins/skin-blue.min.css"/>">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    
    
    
    
    
    
    
    <script type="text/javascript" src="<spring:url value="/resources/JS/jquery-1.11.3.min.js"/>"></script>	
	<script src="http://cdn.leafletjs.com/leaflet-0.7.5/leaflet.js"></script>
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.5/leaflet.css" />
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
	<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
	
	
	<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/CSS/Styles.css"/>"/> 
	<script type="text/javascript" src="<spring:url value="/resources/JS/Scripts.js"/>"></script>


	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"/>

	<script src="<spring:url value="/resources/libs/leaflet-src.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/libs/leaflet.css"/>"/>

	<script src="<spring:url value="/resources/opacity/Control.Opacity.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/opacity/Control.Opacity.css"/>" />

	<script src="<spring:url value="resources/MarkerLabel/Label.js"/>"></script>
	<script src="<spring:url value="resources/MarkerLabel/BaseMarkerMethods.js"/>"></script>
	<script src="<spring:url value="resources/MarkerLabel/Marker.Label.js"/>"></script>
	<script src="<spring:url value="resources/MarkerLabel/FeatureGroup.Label.js"/>"></script>
	<script src="<spring:url value="resources/MarkerLabel/Map.Label.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/MarkerLabel/leaflet.label.css"/>"/>

	<script src="<spring:url value="/resources/src/Leaflet.draw.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/dist/leaflet.draw.css"/>" />

	<script src="<spring:url value="/resources/ControlGroup/leaflet.groupedlayercontrol.min.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/ControlGroup/leaflet.groupedlayercontrol.min.css"/>" />
	
	<script src="<spring:url value="/resources/src/Toolbar.js"/>"></script>
	<script src="<spring:url value="/resources/src/Tooltip.js"/>"></script>

	<script src="<spring:url value="/resources/src/ext/GeometryUtil.js"/>"></script>
	<script src="<spring:url value="/resources/src/ext/LatLngUtil.js"/>"></script>
	<script src="<spring:url value="/resources/src/ext/LineUtil.Intersect.js"/>"></script>
	<script src="<spring:url value="/resources/src/ext/Polygon.Intersect.js"/>"></script>
	<script src="<spring:url value="/resources/src/ext/Polyline.Intersect.js"/>"></script>


	<script src="<spring:url value="/resources/src/draw/DrawToolbar.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Feature.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.SimpleShape.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Polyline.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Circle.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Marker.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Polygon.js"/>"></script>
	<script src="<spring:url value="/resources/src/draw/handler/Draw.Rectangle.js"/>"></script>


	<script src="<spring:url value="/resources/src/edit/EditToolbar.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/EditToolbar.Edit.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/EditToolbar.Delete.js"/>"></script>

	<script src="<spring:url value="/resources/src/Control.Draw.js"/>"></script>

	<script src="<spring:url value="/resources/src/edit/handler/Edit.Poly.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/Edit.SimpleShape.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/Edit.Circle.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/Edit.Rectangle.js"/>"></script>
	<script src="<spring:url value="/resources/src/edit/handler/Edit.Marker.js"/>"></script>

	<link rel="stylesheet" href="<spring:url value="/resources/CSS/lightbox.css"/>"/>

	<script src="http://maps.google.com/maps/api/js?v=3.2&sensor=false"></script>
	<script src="http://matchingnotes.com/javascripts/leaflet-google.js"></script>

	<!-- http://www.bootstraptoggle.com/ -->
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
		
	<script type="text/javascript">

		// temporary variables for intermediate data
		var geoData, loadedDrawings, cir, sharedDrawings;
		var drawingId=0, curSelection = 0;
		var updatedDraw;
		var userId;
		var userType;
		var idIW;
		var popUpLayer;
		var editedLayers;
		var newGroupSlideOpen = false;
		var shareSlideOpen = false;
		var shareFeedSlideOpen = false;

		var drawingsLoaded = false;
		var includeInNewListCreated = false; 
		
		var shareWithGroups = [];
		var shareWithMembers = [];
		
		var baseLayers = [];
		var curBaseLayerIndex = -1;
		
		var allUserDrawings = [];
		var allUsersList = [];
		
		var tempvalue;
		var chk;
		var hehe;
		var temp;
		
		$(document).ready(function() {
			
			// call voyager service when 'search' button is clicked, with search term from the search box
			$('#searchButton').click(function(event){
				var searchText = $('#searchBox').val();
				if(searchText.length > 0){
					var searchTextEncoded = encodeURIComponent(searchText);
					var query = 'http://voyager1.mojavedata.gov:8080/solr/v0/select?q='+searchTextEncoded+'&wt=json&rows=50';
					console.log(query);
					getSearchResults(query, getResultsCallback);
				}
			});
			
			// display the search results in the slide after successful service call
			
		function getResultsCallback(res){
			var response = res.response;
			if(response.numFound > 0){
				var docs = response.docs;
				var count = docs.length;
				for(var i = 0; i < count; i++){
					var doc = docs[i];
					
					var $ctrl = $('<label />').html(doc.name)
                       .prepend($('<input/>').attr({ type: 'checkbox', name: 'result'+i, value: 'result'+i, id: 'result'+i, checked:false}));
					 $("#searchResultsDiv").append($ctrl);
					 $ctrl = $('<br/>');
					 $("#searchResultsDiv").append($ctrl);
				}
			}
		}
			
		$('#showForm').click(function(event){
			showForm();	
		});

			// check user credentials upon 'login' button click
 			$('#buttonLogin').click(function(event){
				var url = "${pageContext.request.contextPath}";
				userId = $('#userId').val();
				checkCredentials(url,loginCallback_success, loginCallback_failure);
			});
 			
 			// check user credentials upon 'login' click
 			$('#anchorLogin').click(function(event){
 				event.preventDefault();
				var url = "${pageContext.request.contextPath}";
				userId = $('#userId').val();
				checkCredentials(url,userLoginCallback_success, userLoginCallback_failure);
			});
 			
 			function userLoginCallback_success(user){
 				userId = user.userId;
 				userType = user.userType;
 				
 				$('#shareDrawingsLI').show();
 				$('#drawingsListLI').show();
 				$('#clearDrawingsLI').show();
 				$('#startNewDrawingLI').show();
 				$('#saveDrawingLI').show();
 				
 				
 				$('#profileMenuBody').hide();
 				$('#profileMenuHeader').show();
 				
 				$('#anchorLogin').hide();
 				$('#anchorLogout').show();

				$("#loginHelpAnchor").hide();
				$("#userProfileAnchor").show();
				
	 			// display the image
				var url = "${pageContext.request.contextPath}";
				var imagePath = url+'/'+'resources/UI/dist/img/user2-160x160.jpg';
				console.log(imagePath);
				
			    $('#userImgBarDropdownId').attr('src',imagePath);
			    $('#userNameBarDropdownDivId').html(userId);

				$('#userNamePId').text(userId);
				$('#userProfileImageId').attr('src',imagePath);
 				
				$('#userId').val('');
				$('#password').val('');
				
 				 if(userType=="A"){
 					console.log("admin");
 					$('#adminSettingsGearAnchor').show();
 				}

 				getUserDrawings(url,getDrawingsCallback);
 			}
 			function userLoginCallback_failure(user){
 				console.log('login failed');
 			}
 			
 			// logout link click action, call service
 			$('#anchorLogout').on("click",function(event){
 			    event.preventDefault();
				var url = "${pageContext.request.contextPath}";
				logoutUser(url,userLogoutCallback); 
				console.log('anchorLogout');
			});
 			
 			function userLogoutCallback(){
 				
 				$('#shareDrawingsLI').hide();
 				$('#drawingsListLI').hide();
 				$('#clearDrawingsLI').hide();
 				$('#startNewDrawingLI').hide();
 				$('#saveDrawingLI').hide();
 				
 				/* $('#shareDrawingsLI').css('display', 'none');
 				$('#drawingsListLI').css('display', 'none');
 				$('#clearDrawingsLI').css('display', 'none');
 				$('#startNewDrawingLI').css('display', 'none');
 				$('#saveDrawingLI').css('display', 'none'); */
 				
 				$('#profileMenuBody').show();
 				$('#profileMenuHeader').hide();
 				
 				$('#anchorLogin').show();
 				$('#anchorLogout').hide();
 				
 				$("#loginHelpAnchor").show();
				$("#userProfileAnchor").hide();
				
 				var url = "${pageContext.request.contextPath}";
				var imagePath = url+'/'+'resources/UI/dist/img/avatar5.png';
				
			    $('#userImgBarDropdownId').attr('src',imagePath);
 				$('#userNameBarDropdownDivId').html('Guest User');

				$('#userNamePId').text('Guest User');
				$('#userProfileImageId').attr('src',imagePath);
				
				$('#adminSettingsGearAnchor').hide();
 			}
 			
 			// upon successful login
 			// ui settings
 			function loginCallback_success(user){
 				$('#loginButtonId').css("visibility","hidden");
 				$('#logoutButtonId').css("visibility","visible");
 				$('#message').text("Hello "+user.userId+"..!");
 				userId = user.userId;
 				userType = user.userType;
 				if(userType=="A"){
 					console.log("admin");
 					$('#createGroupButtonId').css("visibility","visible");
 				}
 				else
 					console.log("user");
 				var menuSlide = $('.slideout-menu');
 				closeSlide(menuSlide);
 			}
 			
 			function loginCallback_failure(user){
 				console.log('login failed');
 			}
 			
 			// check user credentials upon 'login' button click
 			$(document).on('click', '#buttonLogin_1', function(){ 
 				var url = "${pageContext.request.contextPath}";
 				userId = $('#userId').val();
 				checkCredentials(url,loginCallback_success_1, loginCallback_failure_1);
 			 });

	 		// upon successful login
 			// ui settings
 			function loginCallback_success_1(user){

 				userId = user.userId;
 				userType = user.userType;
 				
 				if(userType=="A")
 					console.log("admin");
 				else
 					console.log("user");

 				var greeting = "Hello "+userId+"..!! <span class='caret'></span>";
				$("#anchor_dropdown").html(greeting);
				$('#anchor_dropdown').click();
				
				greeting = "<input type='button' id='buttonLogout_1' value='Logout'  class='btn btn-default' style='display: block; margin-left: auto;margin-right: auto;'/>";
				$("#dropdown-menu_content_div").html(greeting);
 			}	

	 		
 			function loginCallback_failure_1(user){
				console.log('login failed');
 			}	

 			// logout button click action, call service
			$(document).on('click', '#buttonLogout_1', function(){
				var url = "${pageContext.request.contextPath}";
				logoutUser(url,logoutCallback_1);
			});

			// upon successful logout
			// ui settings
			function logoutCallback_1(){

 				var greeting = "Hello Guest.! <span class='caret'></span>";
				$("#anchor_dropdown").html(greeting);

				greeting = "<input type='text' id='userId' value='e' class='form-control' placeholder='User ID' /> <div id='div_userid_mandatory'> *** </div> <input type='password' id='password' value='e'  class='form-control' placeholder='Password' /> <div id='div_userid_mandatory'> *** </div> <input type='button' id='buttonLogin_1' value='Login'  class='btn btn-default' style='display: block; margin-left: auto;margin-right: auto;'/>";
				$("#dropdown-menu_content_div").html(greeting);
			}
 			
 			
 			// toggle menu slide
			$('.slideout-menu-toggle').on('click', function(event){
		    	event.preventDefault();
		    	var menuSlide = $('.slideout-menu');
		    	toggleSlide(menuSlide);
		    });
			
			// toggle search slide
			$('.slideout-search-toggle').on('click', function(event){
				event.preventDefault();
		    	var searchSlide = $('.slideout-search');
		    	toggleSlide(searchSlide);
		    });
			
			// toggle create groups slide
			$('.slideout-creategroup-toggle').on('click', function(event){
				event.preventDefault();
				
				newGroupSlideOpen = !newGroupSlideOpen;
				if(newGroupSlideOpen)
				{
					var url = "${pageContext.request.contextPath}";
					getUsersList(url,getUsersListCallback);
				}
		    	var newGroupSlide = $('.slideout-creategroup');
		    	toggleSlide(newGroupSlide);
		    });
			
			// toggle share drawings slide
			$('.slideout-sharingFeed-toggle').on('click', function(event){
				event.preventDefault();
				shareFeedSlideOpen = !shareFeedSlideOpen;
				if(shareFeedSlideOpen){
					addSharingFeed();
				}
		    	var sharingFeedSlide = $('.slideout-sharingFeed');
		    	toggleSlide(sharingFeedSlide);		    	
		    });

			
			
			
			$('#groupsTabAnchor').click(function(event){
				event.preventDefault();
				
				var url = "${pageContext.request.contextPath}";
				getUsersList(url,getUsersListCallback);
			});
			
			$('#usersTabAnchor').click(function(event){
				event.preventDefault();
				
				var url = "${pageContext.request.contextPath}";
				getUsersList(url,getUsersListCallbackForUsersTab);
			});
			
			function getUsersListCallbackForUsersTab(userList){
				
				$("#existingUsersListUl").empty();
				var ul = document.getElementById("existingUsersListUl");
				
				if(userList.length > 0){
					
					for(var i = 0; i < userList.length; i++){
						var user = userList[i];
						temp=user;
						var $ctrl = $('<label />').html(user.firstName+', '+user.lastName+' ('+user.userId+')')
                        .prepend($('<input/>').attr({ type: 'checkbox', name: 'existingUsers', value: user.userId, id: 'existingUsers'+i, checked:false}));
           
			            var li = document.createElement("li");
			            li.className = 'list-group-item';
			            $ctrl.appendTo(li);
			            ul.appendChild(li);
					}
					addNewDeleteButton("button","Delete",ul);
				}
			}
			
			
			// add a button dynamically to ul
			function addNewDeleteButton(type, name, ul){
				    var element = document.createElement("input"); 
				    element.type = type;
				    element.value = name; 
				    element.name = name;
				    element.className='btn btn-default';
				    
				    var ulist = document.getElementById("existingUsersListUl"); //replace with jquery
				    var li = document.createElement("li");
				    li.appendChild(element);
					ulist.appendChild(li);
					
				    element.onclick = function() {
				        deleteUsersButtonClickCallback();
				    };
			}
			
			function deleteUsersButtonClickCallback(callback){
				var userIds = [], opt;
				
				$('input[type=checkbox][name=existingUsers]').each(function () {
					 if(this.checked){
						 userIds.push(this.value);
					 }
				 });
				var url = "${pageContext.request.contextPath}";
				console.log(userIds);
				if(userIds.length > 0)
					deleteUsers(url,userIds, deleteUsersCallback);
			}
			
			function deleteUsersCallback(message){
					
			}
			
			
			// upon clicking share button to save it in database
			$('#submitSharingButton').click(function(event){
				
				shareWithMembers = [];
				shareWithGroups = [];
				
				// get selected drawingId to share (from the dropdown)
				var dropSelectedNum = parseInt($('#drawingShareDropdown').val());
				var shareDrawingId = loadedDrawings[dropSelectedNum].drawingId;
				
				// get the groups to share with
				var groupNamesList = $('input')
			    .filter(function() {
			        return this.id.match('groupList-*');
			    });
				
				// get the individual users to share directly with
				$.each( groupNamesList, function( index, groupBox ){
					var groupOrderNum = parseInt(groupBox.id.split("-")[1]);
					
					if(groupBox.checked)
						shareWithGroups.push(userGroupsDetails[groupOrderNum].groupId);
					else{
						var filtered = $('input')
					    .filter(function() {
					        return this.id.match('groupMember-'+groupOrderNum+'-*');
					    });
						$.each( filtered, function( index, memberBox ){
							if(memberBox.checked){
								var members = userGroupsDetails[groupOrderNum].groupMembers;
								shareWithMembers.push(members[parseInt(memberBox.id.split('-')[2])]);
							}
						});
					}
				});
				
				// remove duplicates, if any, in the users list, to share the drawing
				var shareWithMembersUnique = [];
				$.each(shareWithMembers, function(i, el){
				    if($.inArray(el, shareWithMembersUnique) === -1) shareWithMembersUnique.push(el);
				});
				
				var url = "${pageContext.request.contextPath}";
				submitSharingRequest(url, shareDrawingId, shareWithGroups, shareWithMembersUnique, submitSharingRequestCallback);
				
			});

			function submitSharingRequestCallback(msg){
				
			}
			
			// logout button click action, call service
			$('#logoutButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				logoutUser(url,logoutCallback);
			});
			
			// upon clicking 'create group' button
			 $('#createNewGroupButtonId').click(function(event){
				 var groupName = $('#groupNameTextBox').val();
				 if(groupName.length > 0){
					 var selectedUsers = [];
					 $('input[type=checkbox][name=listUsers]').each(function () {
						 if(this.checked){
							 selectedUsers.push(this.value);
						 }
					 });
					 console.log (selectedUsers);
					 if(selectedUsers.length>0){
						 var url = "${pageContext.request.contextPath}";
						 createNewGroup(url, groupName, selectedUsers, createNewGroupCallback);
					 }
				 }
			 });
			
			 function createNewGroupCallback(message){
				 /* var groupSlide = $('.slideout-creategroup');
		    	 toggleSlide(groupSlide); */
			 }
			 
			 
			 $('#createUserButton').click(function(event){
				 
				 var url = "${pageContext.request.contextPath}";
				 var firstName = $('#newuserFirstName').val();
				 var lastName = $('#newuserLastName').val();
				 var title = $('#newuserTitle').val();
				 var email = $('#newuserEmail').val();
				 var userId = $('#newuserUserId').val();
				 var password = $('#newuserPassword').val();
				
				 if(firstName.length > 0 && lastName.length > 0 && title.length > 0 && email.length > 0 && userId.length > 0 && password.length > 0)
					 createUser(url, firstName, lastName, title, email, userId, password, createUserSuccessCallback)
			 });
			 
			 function createUserSuccessCallback(message){
				 
			 }
			 
			 
			 
			 
			 // upon clicking save drawing button
			$('#saveDrawingsAnchorId').click(function(event){
				event.preventDefault();
				
				var drawingName = $("#drawingNameId").val();
				
				var url = "${pageContext.request.contextPath}";

				if(drawingId==0){
					// if the drawing is not already saved					
					saveDrawings(url, map, drawingName, drawnItems, saveDrawingsCallback);
				}
				else{
					// already saved, to update the drawing
					updateDrawings(url, map, drawingId, drawnItems, updateCallback);
				}
			});
			 
			 // upon clicking saveas new drawing button
			$('#saveAsNewDrawingsAnchorId').click(function(event){
				event.preventDefault();
				var drawingName = $("#drawingNameId").val();
				
				var url = "${pageContext.request.contextPath}";
				saveDrawings(url, map, drawingName, drawnItems, saveDrawingsCallback);
			});			
			
			
			
			// get saved drawings from the database
 			$('#getDrawingsButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				 getUserDrawings(url,getDrawingsCallback);				
			}); 
 			
 			$('#getDrawingsAnchorId').click(function(event){
 				event.preventDefault();

 				//if(drawingsLoaded || typeof(loadedDrawings)=="undefined")
 				if(drawingsLoaded)	
 					return;

				var url = "${pageContext.request.contextPath}";
				getUserDrawings(url,getDrawingsCallback);
			});
 			
 			
 			$('#allDrawingsTabAnchor').click(function(event){
 				event.preventDefault();

 				var url = "${pageContext.request.contextPath}";
				getAllDrawings(url,getAllDrawingsCallback);
			});
 			
 			function getAllDrawingsCallback(allDrawings){
 				
 				allUserDrawings = allDrawings;
 				
 				$('#allDrawingsUl').empty();
				var ul = document.getElementById("allDrawingsUl");
				
				for (var i=0; i < allUserDrawings.length; i++){
					 var drawing = allUserDrawings[i];
					 temp = drawing;
	 				 var $ctrl = $('<label />').html(drawing.drawingName+' ('+drawing.userId+')')
	                 .prepend($('<input/>').attr({ type: 'checkbox', name: 'allDrawingCheckbox', value: drawing.drawingId, id: 'allUserDrawing'+i, checked:false}));
					
					var li = document.createElement("li");
					$ctrl.appendTo(li);
					ul.appendChild(li);
				}
				
				
				var element = document.createElement("input"); 
			    element.type = 'button';
			    element.value = 'Delete'; 
			    element.name = 'deleteDrawingsAllUsers';
			    element.className='btn btn-default';
			    
			    var ulist = document.getElementById("allDrawingsUl"); //replace with jquery
			    var li = document.createElement("li");
			    li.appendChild(element);
				ulist.appendChild(li);
				
			    element.onclick = function() {
			        deleteAllUserDrawingsButtonClickCallback();
			    };			    
 			}
 			
 			function deleteAllUserDrawingsButtonClickCallback(){
 				var drawingIds = [];
 				
 				$('input[type=checkbox][name=allDrawingCheckbox]').each(function () {
 					 if(this.checked)
 						drawingIds.push(parseInt(this.value));
 				 });

 				var url = "${pageContext.request.contextPath}";

 				if(drawingIds.length > 0)
 					deleteAllUserDarawingsServiceCall(url, drawingIds, deleteAllUserDarawingsServiceCallBack);
 					//deleteAllUserDarawingsServiceCallBack(drawingIds);
 			}
 			
 			Array.prototype.removeValue = function(name, value){
				   var array = $.map(this, function(v,i){
				      return v[name] === value ? null : v;
				   });
				   this.length = 0; //clear original array
				   this.push.apply(this, array); //push all elements except the one we want to delete
			}
 			
 			function deleteAllUserDarawingsServiceCallBack(drawingIds){
				console.log(drawingIds);
 				for(var i=0; i < drawingIds.length; i++){
 					removeAllUserDrawing(drawingIds[i]);
 					allUserDrawings.removeValue('drawingId', drawingIds[i]);
 				}
 				getAllDrawingsCallback(allUserDrawings);
 			}
 			
 			
 			
			$('#test').click(function(event){
//				var url = "${pageContext.request.contextPath}";
//				getUserGroupsAndShareDrawings(url,getUserGroupsAndShareDrawingsCallback);
				var greeting = "Hello User.! "+"<span class='caret'></span>";
				$("#anchor_dropdown").html(greeting);
				
				greeting = "<input type='text' id='userId' value='e' class='form-control' placeholder='User ID' /> <div id='div_userid_mandatory'> *** </div> <input type='password' id='password' value='e'  class='form-control' placeholder='Password' /> <div id='div_userid_mandatory'> *** </div> <input type='button' id='buttonLogin_1' value='Login'  class='btn btn-default' style='display: block; margin-left: auto;margin-right: auto;'/>";
				$("#dropdown-menu_content_div").html(greeting);
				
			});
			
			// display any shared drawing when selected
			$(document).on('change', '#sharedDrawingsDropDown', function() {
				console.log('shared option changed');
				var optionSelected = $("option:selected", this);

				curSelection = parseInt(optionSelected.val());
				var shapes = sharedDrawings[curSelection];
				console.log("Option changed: "+shapes);
				showDrawings(true, shapes);
			});
			
			// 'clear drawings' button click
			$('#clearDrawingsButtonId').click(function(event){
				clearDrawings();
			});
			$('#clearDrawingsAnchorId').click(function(event){
				event.preventDefault();
				clearDrawings();
			});
			
			
			// 'new drawing' button click
			$('#newDrawingAnchorId').click(function(event){
				event.preventDefault();
				
				// clear the drawings currently being displayed
				
				if(includeInNewListCreated || typeof(loadedDrawings)=="undefined")
					return;
				
				clearDrawings();
				includeInNewListCreated = true;
				
				$('#includeDrawingsUL').empty();
				var ul = document.getElementById("includeDrawingsUL");

				// add user drawings to multi select
				// user can include the existing drawins in the new drawing by selecting items from this list
				if(loadedDrawings.length > 0)
				{
					for(var i=0; i<loadedDrawings.length;i++){
						// change to drawing name here
						var drawing = loadedDrawings[i];
						
						// add checkbox to add/remove
						 var $ctrl = $('<label />').html(drawing.drawingName+' ('+drawing.userId+')')
                         .prepend($('<input/>').attr({ type: 'checkbox', name: 'includeInNewDrawingCheckbox', value: i, id: 'incDrawing'+i, checked:false}));
						
						var li = document.createElement("li");
						$ctrl.appendTo(li);
						ul.appendChild(li);
					}
					
					// add a dynamic button
					// click this button to include the selected drawings in the current drawing 
					addNewButton("button","Add", ul);
				}
			});
			
		});
	
		// add the list of users to the slide
		// user can select any number of users to include in the group
		function getUsersListCallback(userList){
			allUsersList = userList;
			
	 		$("#userListDiv").empty();
			if(userList.length > 0){
				var count = userList.length;
				for(var i = 0; i < count; i++){
					var user = userList[i];
					
					var $ctrl = $('<label />').html(user.firstName+', '+user.lastName+' ('+user.userId+')')
                    .prepend($('<input/>').attr({ type: 'checkbox', name: 'listUsers', value: user.userId, id: 'listUser'+i, checked:false}));
					 $("#userListDiv").append($ctrl);
					 $ctrl = $('<br/>');
					 $("#userListDiv").append($ctrl);
				}
			}
		}
		
 
		function getBaseLayers(){
			var url = "${pageContext.request.contextPath}";
			getBaseLayersFromService(url,getBaseLayersCallback);
		}
		
		// add the base layers and properties such as min, max zoom etc., from db to the list
		// user can select any base layer from this list
		function getBaseLayersCallback(returnBaseLayers){
			
			
			var sel = document.createElement("select");
			sel.id = 'baseLayersDropDown';
			sel.multiple="multiple";
			sel.size="4";
							
			
			

			
			
			for(var i=0; i < returnBaseLayers.length; i++){
				var baseLayer = returnBaseLayers[i];
				var layerGroup;
				var layer;
				
				if(baseLayer.provider == "Google"){
					if(baseLayer.url == 'TERRAIN')
						layer = new L.Google('TERRAIN');
					if(baseLayer.url == 'SATELLITE')
						layer = new L.Google('SATELLITE');
					if(baseLayer.url == 'ROADMAP')
						layer = new L.Google('ROADMAP');
					
					/* layer = new L.Google("'"+baseLayer.url+"'");*/
					console.log("'"+baseLayer.url+"'");
					layerGroup = L.layerGroup([layer]);
					hehe = baseLayer;
				}else{
					layer = L.tileLayer(baseLayer.url);  
					
					if(baseLayer.options != null){
						var options = JSON.parse(baseLayer.options);
						if(options.hasOwnProperty("maxZoom")){
							layer.options.maxZoom = options.maxZoom;
						}
						if(options.hasOwnProperty("minZoom")){
							layer.options.minZoom = options.minZoom;
						}
						if(options.hasOwnProperty("id")){
							layer.options.id = options.id;
						}
						if(options.hasOwnProperty("accessToken")){
							layer.options.accessToken = options.accessToken;
						}
					}
					layerGroup = L.layerGroup([layer]);
				}
				
				var op = new Option();
				op.value = baseLayer.id;
				op.text = baseLayer.displayName;
				sel.options.add(op);
				
				
				layer.options.name = baseLayer.displayName;
				layer.options.id = baseLayer.id;
				
				baseLayers[i] = layer;
				// baseLayers[baseLayer.displayName] = layerGroup;
			}
			var controls = L.control.layers(baseLayers);
		//	controls.addTo(map);
			map.addLayer(baseLayers[0]);
			curBaseLayerIndex = 0;
			
			$('#baseLayersDiv').html(sel);
		}
		
		// drop down change action
		$(document).on('change', '#baseLayersDropDown', function() {
			console.log('option changed');
			var optionSelected = $("option:selected", this);
			hehe = optionSelected;
			
			curSelection = parseInt(optionSelected.index());
			
			var curBaseLayer = baseLayers[curBaseLayerIndex];
			map.removeLayer(curBaseLayer);
			curBaseLayer = baseLayers[curSelection];
			map.addLayer(curBaseLayer);
			curBaseLayerIndex = curSelection;
		});
		
		
		// add a button dynamically to ul
		function addNewButton(type, name, ul){
			    var element = document.createElement("input"); 
			    element.type = type;
			    element.value = name; 
			    element.name = name;
			    
			    var ulist = document.getElementById("includeDrawingsUL"); //replace with jquery
			    var li = document.createElement("li");
			    li.appendChild(element);
				ulist.appendChild(li);
				
			    
			    element.onclick = function() {
			        addDrawingsButtonClickCallback(includeInNewDrawing);
			    };
		}
		
		// add the selected drawings to the included drawings list upon clicking the button 
		function addDrawingsButtonClickCallback(callback){
			var opts = [], opt;
			

			$('input[type=checkbox][name=includeInNewDrawingCheckbox]').each(function () {
				 if(this.checked){
					 var shapes = loadedDrawings[this.value];
					 opts.push(shapes);
				 }
			 });
		    
		    if (callback) {
		    	callback(opts);
            }
		}
		
		// second callback for add button click
		function includeInNewDrawing(inclDraws){
			for(var i=0; i<inclDraws.length; i++)
				showDrawings(false, inclDraws[i]);
			drawingId = 0;
		}
		
		// clear drawings
		// remove each currently displaying shape (layer) from the base layer
		function clearDrawings(){
			drawingId = 0;
			var len = drawnItems.getLayers().length;
			for(var i=0; i< len; i++){
				var layer = drawnItems.getLayers()[0]; 
				drawnItems.removeLayer(layer);
			}
		}
		

		
		// upon successful logout
		// ui settings
		function logoutCallback(){
			$('#logoutButtonId').css("visibility","hidden");
			$('#loginButtonId').css("visibility","visible");
			$('#message').text("Please login");
			$('#createGroupButtonId').css("visibility","hidden");
		}
		
		function saveDrawingsCallback(returnDrawingId){
			drawingId = returnDrawingId;
		}

		// upon successful update of drawing
		function updateCallback(updatedDrawing) {
			// reflect the changes in loaded list, the one currently selected
			loadedDrawings[curSelection] = updatedDrawing;
			
			// clear and show the updated one 
			clearDrawings();
			showDrawings(true, updatedDrawing);
		}
	
		// add fetched drawings (saved previously by the user) to the dropdown list
		function getDrawingsCallback(drawings) {
			
			if (drawings.length > 0) {
				loadedDrawings = drawings;
				drawingsLoaded = true;
				
				var sel = document.createElement("select");
				sel.id = 'dropDown';
				sel.multiple="multiple";
				if(loadedDrawings.length > 4 )
					sel.size="4";
				else
					sel.size = loadedDrawings.length;				
				
				for (var i = 0; i < drawings.length; i++) {
					var drawing = drawings[i];
					
					var op = new Option();
					op.value = i;
					op.text = drawing.drawingName;
					sel.options.add(op);
				}
				$('#userDrawingsListDiv').html(sel);
			}
			console.log('calling getUserGroupsAndShareDrawingsCallback');
			var url = "${pageContext.request.contextPath}";
			getUserGroupsAndShareDrawings(url,getUserGroupsAndShareDrawingsCallback);
			

			/* if (loadedDrawings.length > 0) {
				var shapes = loadedDrawings[0];
				showDrawings(true, shapes);
			} */
		}
		
		function getUserGroupsAndShareDrawingsCallback(msg){
			addDrawingsAndGroupsListToDropdown();
			getSharedDrawings();
			//addSharingFeed();
		}
		
		
		// add sharing feed details to the slide upon successful service call
		function addSharingFeed(){
			
			var userGroupIds = [];
			for(var i=0; i < userGroupsDetails.length; i++){
				var group = userGroupsDetails[i];
				userGroupIds.push(group.groupId);
			}
			
			
			// shared with groups the user is part of
			var groupShared = userGroupsAndSharedDrawings.groupSharedDrawingsInfo;
			// shared directly to the user
			var memberShared = userGroupsAndSharedDrawings.memberSharedDrawingsInfo;
			
			var userGroups = userGroupsAndSharedDrawings.userGroups;
			
			
			// clear feed div and add the group sharing feed
			$('#sharingFeedDiv').empty();
			
			var feedULGroup = document.getElementById("shareFeedULGroup");
			var feedULSelf = document.getElementById("shareFeedULSelf");
			
			for(var i=0; i < groupShared.length; i++){
				var shared = groupShared[i];
				var common =  $(shared.sharedWithGroups).filter(userGroupIds);
				
				var commonGroupsString = "";
				for(var a=0; a< common.length; a++){
					for(var b=0; b<userGroups.length; b++){
						var group = userGroups[b];
						if(group.groupId == common[a]){
							commonGroupsString = commonGroupsString+"  "+group.groupName;
							break;
						}
					}
				}
				
				var drawingName = "";
				for(var a=0; a < sharedDrawings.length; a++){
					var draw = sharedDrawings[a];
					if(draw.drawingId == shared.sharedDrawingId){
						drawingName = draw.drawingName;
					}
				}
				
				var userName = shared.sharedByUser;
				for(var a = 0; a < userGroupsAndSharedDrawings.usersInfo.length; a++){
					var curUser = userGroupsAndSharedDrawings.usersInfo[a];
					if(curUser.userId == shared.sharedByUser){
						userName = curUser.firstName + ", "+ curUser.lastName;
						break;
					}
				}
				
				/* $("#sharingFeedDiv").append("<div> Shared Drawing Id   : "+drawingName+"</div> <br/>");
				$("#sharingFeedDiv").append("<div> Shared With Group(s): "+commonGroupsString+"</div> <br/>");
				$("#sharingFeedDiv").append("<div> Shared By User      : "+userName+"</div> <br/>"); */
				
				
				var li = document.createElement("li");
				
				var img = document.createElement('img');
				img.src = '<spring:url value="/resources/UI/dist/img/user2-160x160.jpg"/>';
				img.className = 'img-circle';
				img.style.margin = 'auto 10px auto auto';
				img.style.width = '40px';
				img.style.width = '40px';
				
				var rightDiv = document.createElement("div");
				rightDiv.className ="pull-left";
				
				rightDiv.appendChild(img);
				
				var h4 = document.createElement("h4");
				h4.textContent = drawingName;
				
				var p = document.createElement("p");
				var text = document.createTextNode(userName);
				p.appendChild(text);
				
				var a = document.createElement('a');
				a.appendChild(rightDiv);
				a.appendChild(h4);
				a.appendChild(p);
				
				li.appendChild(a);
				
				feedULGroup.appendChild(li);
			}
			
			// drawings shared directly to the user
			$("#sharingFeedDiv").append("<br/><hr/><br/>");
			for(var i=0; i < memberShared.length; i++){		
				var shared = memberShared[i];
				
				var drawingName = "";
				for(var a=0; a < sharedDrawings.length; a++){
					var draw = sharedDrawings[a];
					if(draw.drawingId == shared.sharedDrawingId){
						drawingName = draw.drawingName;
					}
				}
				
				var userName = shared.sharedByUser;
				for(var a = 0; a < userGroupsAndSharedDrawings.usersInfo.length; a++){
					var curUser = userGroupsAndSharedDrawings.usersInfo[a];
					if(curUser.userId == shared.sharedByUser){
						userName = curUser.firstName + ", "+ curUser.lastName;
						break;
					}
				}
				
				/* $("#sharingFeedDiv").append("<div> Shared Drawing Id   : "+drawingName+"</div> <br/>");
				$("#sharingFeedDiv").append("<div> Shared By User      : "+userName+"</div> <br/>"); */
				var li = document.createElement("li");
				
				var img = document.createElement('img');
				img.src = '<spring:url value="/resources/UI/dist/img/user2-160x160.jpg"/>';
				img.className = 'img-circle';
				img.style.margin = 'auto 10px auto auto';
				img.style.width = '40px';
				img.style.width = '40px';
				
				var rightDiv = document.createElement("div");
				rightDiv.className ="pull-left";
				
				rightDiv.appendChild(img);
				
				var h4 = document.createElement("h4");
				h4.textContent = drawingName;
				
				var p = document.createElement("p");
				var text = document.createTextNode(userName);
				p.appendChild(text);
				
				var a = document.createElement('a');
				a.appendChild(rightDiv);
				a.appendChild(h4);
				a.appendChild(p);
				
				li.appendChild(a);
				
				feedULSelf.appendChild(li);
			}
		}
		
		
		/*
		RECURSIVE FUNCTION TO GET ALL INCLUDED DRAWINGS
		*/
		function getSharedDrawings(){
			var url = "${pageContext.request.contextPath}";
			
			var groupShared = userGroupsAndSharedDrawings.groupSharedDrawingsInfo;
			var memberShared = userGroupsAndSharedDrawings.memberSharedDrawingsInfo;
			var sharedIds=[];
			
			if(groupShared.length>0){
				for(var i=0; i< groupShared.length; i++){
					var shared = groupShared[i];
					sharedIds.push(shared.sharedDrawingId);
				}
			}
			
			if(memberShared.length>0){
				for(var i=0; i< memberShared.length; i++){
					var shared = memberShared[i];
					sharedIds.push(shared.sharedDrawingId);
				}
			}
			
			var sharedIdsUnique = [];
			$.each(sharedIds, function(i, el){
			    if($.inArray(el, sharedIdsUnique) === -1) sharedIdsUnique.push(el);
			});
			
			getSharedDrawingsCall(url,sharedIdsUnique,getSharedDrawingsCallback);
			
		}
		
		// once shared drawings are fetched from db, add them to the dropdown
		function getSharedDrawingsCallback(drawings){
			sharedDrawings = drawings;

			if (sharedDrawings.length > 0) {
				var sel = document.createElement("select");
				sel.id = 'sharedDrawingsDropDown';

				for (var i = 0; i < sharedDrawings.length; i++) {
					var drawing = sharedDrawings[i];
					
					var op = new Option();
					op.value = i;
					op.text = drawing.drawingName+' ('+drawing.userId+')'
					sel.options.add(op);
				}
				$('#sharedDrawingsListDiv').html(sel);
			}
			
			addSharingFeed();
			
			/* if (loadedDrawings.length > 0) {
				var shapes = loadedDrawings[0];
				showDrawings(true, shapes);
			} */
		}
		
		// toggle share slide
		$('.slideout-share-toggle').on('click', function(event){
			event.preventDefault();
			shareSlideOpen = !shareSlideOpen;
			if(shareSlideOpen){
				addDrawingsAndGroupsListToDropdown();
			}
	    	var shareSlide = $('.slideout-share');
	    	toggleSlide(shareSlide);		    	
	    });

		// add saved drawings to the drop downs, and the groups the the user is part of to the slide
		// user can select any drawing and groups, members to share the drawing
		function addDrawingsAndGroupsListToDropdown(){

			$('#drawingShareDropdown').empty();
			var sel = document.getElementById('drawingShareDropdown');
			if(typeof(loadedDrawings) !=  "undefined")
			for(var i=0; i<loadedDrawings.length;i++){
				var drawing = loadedDrawings[i];
				var op = new Option();
				op.value = i;
				op.text = drawing.drawingName;
				sel.options.add(op);
			}
			
			$('#userGroupsDiv').empty();
			for(var i=0; i<userGroupsDetails.length;i++){		
				var group = userGroupsDetails[i];
				var members = group.groupMembers;
				
				$("#userGroupsDiv").append("<div>  <input type='checkbox' id='groupList-"+i+"'>  "+group.groupName+"</div>");
				$('#userGroupsDiv').append("<ul id='groupListUl"+i+"'></ul>");
			    for (var j = 0; j < members.length; j++) {
			          $("#groupListUl"+i).append("<li> <input type='checkbox' id='groupMember-"+i+"-"+j+"'> "+members[j]+"</li>");
			    }
			}
		}
		
		// drop down change action
		$(document).on('change', '#dropDown', function() {
			console.log('option changed');
			var optionSelected = $("option:selected", this);

			//console.log(optionSelected.text()+"*******"+optionSelected.val());
			curSelection = parseInt(optionSelected.val());
			var shapes = loadedDrawings[curSelection];
			console.log("Option changed: "+shapes);
			showDrawings(true, shapes);
		});

		function getColor(type) {
			switch (type) {
			case 'polygon':
				return 'purple';
			case 'polyline':
				return 'red';
			case 'rectangle':
				return 'green';
			case 'circle':
				return 'steelblue';
			default:
				return 'black';
			}
		}

		// show the drawing (which has shapes) with properties such as center, zoom, base layer etc
		// 'clear' indicates whether to clear the drawings or not
		function showDrawings(clear, shapes) {

			if (clear)
				clearDrawings();

			geoData = JSON.parse(shapes.jsonData);
			drawingId = shapes.drawingId;

			var zoom = shapes.zoomLevel;
			var cen = shapes.jsonCenter;

			// move the map center
			if (typeof (cen) != "undefined")
				if (cen != null)
					map.panTo(JSON.parse(cen));

			// set the zoom level
			if (typeof (zoom) != "undefined")
				if (zoom != null)
					map.setZoom(zoom);

			/*			geoData.features.forEach(function(layer){
			 if(layer.props.type == 'circle')
			 {
			 cir = L.circle([layer.geometry.coordinates[0],layer.geometry.coordinates[1]], layer.props.radius * 10);
			 //					console.log(layer.geometry.coordinates[0]);
			 //					console.log(layer.geometry.coordinates[1]);

			 //					cir.editing.enable();
			 //					cir.addTo(map);
			 //					var cirGeo = cir.toGeoJSON();
			 //					drawnItems.addLayer(cirGeo);
			 //					drawnItems.addLayer(L.geoJson(cir));
			 }
			 else{
			 drawnItems.addLayer(L.geoJson(layer));

			 //					drawnItems.addLayer(lay);
			 console.log(layer.props.type+" yet to add");
			 }
			 });		*/
//jjjjj

			// display each shape with its properties such as opacity, color etc
			var savedLayers = L.geoJson(geoData);
			savedLayers.eachLayer(function(lay) {
				console.log(lay);
				var props = lay.feature.props;
				var type = props.type;
				//lay.options.color = getColor(type);
				lay.options.color = props.color;
				lay.options.opacity = props.opacity;
				console.log(type);
				//if (type == 'circle') {} else{}
				drawnItems.addLayer(lay);
				if(type=="marker"){
					var title = props.title;
					if(typeof(title)!="undefined" && title.length > 0)
						lay.bindLabel(title);
						//lay.setLabelNoHide(true);
				}
			});
			
			// if there are any included drawings in the drawing
			if(geoData.hasOwnProperty('includeDrawings'))
			{

				var includeIds = geoData.includeDrawings;
				var ul = document.getElementById("includedDrawingsCheckBoxesUL");
				
				
				// for every included drawing, get shapes and show
				for(var j=0; j<includeIds.length; j++){
					var includedId = includeIds[j];

					// get the shapes from the loaded drawings for the included id
					if(typeof(loadedDrawings) !=  "undefined")
					for(var i=0; i<loadedDrawings.length; i++){
						var drawings = loadedDrawings[i];
						if(drawings.hasOwnProperty('drawingId')){
							var drwId = drawings.drawingId;
							
							if(includedId == drwId){

								geoData = JSON.parse(drawings.jsonData);
								savedLayers = L.geoJson(geoData);
								
								savedLayers.eachLayer(function(lay) {
									var props = lay.feature.props;
									var type = props.type;
									//lay.options.color = getColor(type);
									lay.options.color = props.color;
									lay.options.opacity = props.opacity;
									console.log(type);
									//if (type == 'circle') {} else{}
									if(type=="marker"){
										var title = props.title;
										if(typeof(title)!="undefined" && title.length > 0)
											lay.bindLabel(title);
											//lay.setLabelNoHide(true);
									}

									// drawnItems are the layers currently being displayed on baselayer
									// add this layer to drawnItems (to display)
									drawnItems.addLayer(lay);
								});

								// add checkbox to add/remove
								 var $ctrl = $('<label />').html(drawings.drawingName)
		                          .prepend($('<input/>').attr({ type: 'checkbox', name: includedId, value: includedId, id: 'inclDrawing'+i, checked:true}));
								
								var li = document.createElement("li");
								$ctrl.appendTo(li);
								ul.appendChild(li); 

							}
						}
					}
				}

				if(includeIds.length == 0){
					$('#includedDrawingsCheckBoxesUL').empty();
				}
			}
		}
		
		// checkbox select/deselect handling
		$(document).on('change', '[type=checkbox]', function() {
			chk = $(this);
			var id = chk.attr('id');
			var drawId = parseInt(chk.attr('value'));

			
			if (id.match("^allUserDrawing")){
				// drawings add/remove
				if(chk.is(":checked")){
					addAllUserDrawing(drawId);
				}else{
					removeAllUserDrawing(drawId);
				}
			}
			else if (id.match("^inclDrawing")){
				// drawings add/remove
				if(chk.is(":checked")){
					addIncludeDrawing(drawId);
				}else{
					removeIncludeDrawing(drawId);
				}
			}
			else if (id.match("^result")){
				// search results add/remove
				if(chk.is(":checked")){
					console.log('result checked');
					//
				}else{
					console.log('result unchecked');
					//
				}
			}
 			else if (id.match("^groupList-")){
 				// select/deselect groups to be shared with
				if(chk.is(":checked")){
					checkedGroup(id);
				}else{
					unCheckedGroup(id);
				}
			}
 			else if (id.match("^groupMember-")){
 				// select/deselect members in the group
				if(chk.is(":checked")){
					
				}else{
					unCheckedGroupMember(id);
				}
			}
 			else if (id.match("^drawControlCheckboxId")){
				if(chk.is(":checked")){
					map.addControl(drawControl);
				}else{
					map.removeControl(drawControl);
				}
			}
		});

		// group selected
		function checkedGroup(id){
			var splits = id.split("-");
			var groupNum = parseInt(splits[1]);
			var filtered = $('input')
		    .filter(function() {
		        return this.id.match('groupMember-'+groupNum+'-*');
		    });
			
			// select all the members in the group 
			$.each( filtered, function( index, memberBox ){
				memberBox.checked = true;
			});
		}
		
		// group deselected
		function unCheckedGroup(id){
			var splits = id.split("-");
			var groupNum = parseInt(splits[1]);
			var filtered = $('input')
		    .filter(function() {
		        return this.id.match('groupMember-'+groupNum+'-*');
		    });
		    // deselect all the members in the group
			$.each( filtered, function( index, memberBox ){
				memberBox.checked = false;
			});
		}
		
		// group member deselected
		// deselect the corresponding group
		function unCheckedGroupMember(id){
			var groupOrderNum = parseInt(id.split('-')[1]);
			$('#groupList-'+groupOrderNum).attr('checked', false);
		}
		
		// get the included drawing from loaded(saved) drawings and show them on the baselayer
		function addIncludeDrawing(includedId){

			// get the drawing to be included from loadedDrawings
			for(var i=0; i<loadedDrawings.length; i++){
				var drawings = loadedDrawings[i];
				var drwId = drawings.drawingId;
				if(includedId == drwId){

					geoData = JSON.parse(drawings.jsonData);
					savedLayers = L.geoJson(geoData);
					
					savedLayers.eachLayer(function(lay) {
						var props = lay.feature.props;
						var type = props.type;
						//lay.options.color = getColor(type);
						lay.options.color = props.color;
						lay.options.opacity = props.opacity;
						console.log(type);
						//if (type == 'circle') {} else{}

						// add to display layers	
						drawnItems.addLayer(lay);
					});
					break;
				}
			}
		}
		
		// remove the included drawing
		function removeIncludeDrawing(drawId){
			drawnItems.eachLayer(function(layer){
				if(layer.feature.props.drawingId == drawId)
					drawnItems.removeLayer(layer);
			});
		}
		
		
		
		// get the the drawing from allDrawings and show them on the baselayer
		function addAllUserDrawing(includedId){

			// get the drawing to be included from loadedDrawings
			for(var i=0; i<allUserDrawings.length; i++){
				var drawings = allUserDrawings[i];
				var drwId = drawings.drawingId;
				if(includedId == drwId){

					geoData = JSON.parse(drawings.jsonData);
					savedLayers = L.geoJson(geoData);
					
					savedLayers.eachLayer(function(lay) {
						var props = lay.feature.props;
						var type = props.type;
						//lay.options.color = getColor(type);
						lay.options.color = props.color;
						lay.options.opacity = props.opacity;
						console.log(type);
						//if (type == 'circle') {} else{}

						// add to display layers	
						drawnItems.addLayer(lay);
					});
					break;
				}
			}
		}
		
		// remove alluser drawing
		function removeAllUserDrawing(drawId){
			drawnItems.eachLayer(function(layer){
				if(layer.feature.props.drawingId == drawId)
					drawnItems.removeLayer(layer);
			});
		}
		
		
	</script>
    
    <script type="text/javascript">
    var files = [], result;

    // file handling for image upload
    $(document)
            .on(
                    "change",
                    "#fileLoader",
                    function(event) {
                     files=event.target.files;
                    });
    // submit button click
    $(document)
            .on(
                    "click",
                    "#fileSubmit",
                    function() {
                    processUpload();
                    });
    // upload process
    function processUpload()
              {
		    	var url = "${pageContext.request.contextPath}";
                  var oMyForm = new FormData();
                  oMyForm.append("file", files[0]);
                 
                 // call drawshapescontroller/savefiles.html file to upload any type of file 
                 $.ajax({dataType : 'text',
                        url : url+"/drawshapescontroller/savefiles.html",
                        data : oMyForm,
                        type : "POST",
                        enctype: 'multipart/form-data',		// data will be sent as multi part
                        processData: false, 
                        contentType:false,

                        success : function(msg) {
                        	// save the image name in its properties and display the image upon successful upload

                        	
                        	result = msg;
                            console.log("Success: "+result);
                            files = [];
                            
                           	var layer = popUpLayer;
           			     	var fea = layer.feature;
            				var props;

            				if(typeof(fea)!="undefined")
            					props = fea.props;
            				else
            					props= layer.props;
            				
            				// save in properties
                            props.image = result;
                            
                            // display the image
            				var url = "${pageContext.request.contextPath}";
            				var imagePath = url+'/'+props.image;
            			    $('#imageHolder').attr('src',imagePath).height(60).width(60);
            			    $('#imageAnchor').attr('href',imagePath);
                        },
                        error : function(msg){
                        	result = msg;
                        	console.log("Error: "+result);
                        }
                    });
              }
    </script>
    	
	
  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <%-- <span class="logo-mini" style="max-width:20%; max-height:20%;"><img src="<spring:url value="/resources/UI/dist/img/avatar.png"/>" class="img-circle" alt="User Image"></span> --%>
          <span class="logo-mini" style="max-width:20%; max-height:20%;"><img src="<spring:url value="/resources/UI/dist/img/avatar.png"/>" style="width:40px; height:40px;" alt="User Image"></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Mojavedata</b></span>
        </a>
        
        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>

          

<!--           <form class="navbar-form navbar-left" role="search">
  <div class="form-group">
    <input type="text" class="form-control" placeholder="Type a location..">
  </div>
  <button type="submit" class="btn btn-default">Search</button>
</form> -->
          
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the messages -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <!-- User Image -->
                            <img src="<spring:url value="/resources/UI/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
                          </div>
                          <!-- Message title and timestamp -->
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <!-- The message -->
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                    </ul><!-- /.menu -->
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li><!-- /.messages-menu -->

              <!-- Notifications Menu -->
              <li class="dropdown notifications-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- Inner Menu: contains the notifications -->
                    <ul class="menu">
                      <li><!-- start notification -->
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li><!-- end notification -->
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              <!-- Tasks Menu -->
              <li class="dropdown tasks-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>
                    <!-- Inner menu: contains the tasks -->
                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <!-- Task title and progress text -->
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <!-- The progress bar -->
                          <div class="progress xs">
                            <!-- Change the css width attribute to simulate progress -->
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li><!-- end task item -->
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>
              
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img id="userImgBarDropdownId" src="<spring:url value="/resources/UI/dist/img/avatar5.png"/>" class="user-image" alt="User Image">
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs" id="userNameBarDropdownDivId">Guest User</span>
                </a>
                
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li id="profileMenuHeader" class="user-header" style="display: none">
                    <img id="userProfileImageId" src="" class="img-circle" alt="User Image">
                    <p id="userNamePId">
                      Alexander Pierce - Web Developer
                    </p>
                    <!-- <small>Member</small> -->
                  </li>
                  <!-- Menu Body -->
                  <li id="profileMenuBody" class="user-body">
                 		<form class="form" id="formLogin" class="pull-right"> 
	                  		<input type="text" id="userId" placeholder="Username" />
							<input type="password" id="password" placeholder="Password" /><!-- value="e"  -->
						</form>
				  </li>
                  <!-- Menu Footer-->                  
                  <li id="profileMenuFooter" class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat" id="loginHelpAnchor">Help?</a>
                      <a href="#" class="btn btn-default btn-flat" style="display:none" id="userProfileAnchor">Profile</a>
                    </div>
                    <div id="logInOutAnchorDivId" class="pull-right">
                      <a href="#" class="btn btn-default btn-flat" id="anchorLogin">Sign In</a>
                      <a href="#" class="btn btn-default btn-flat" style="display:none" id="anchorLogout">Sign Out</a>                      
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <!-- <a href="#" id="adminSettingsGearAnchor" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
                <a href="#" id="adminSettingsGearAnchor" style="display:none" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <%-- <div class="user-panel">
            <div class="pull-left image">
              <img src="<spring:url value="/resources/UI/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
              <!-- Status -->
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div> --%>

<!--           search form (Optional)
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form> -->
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
          	<li class="header">Menu</li>
            
            <li class="treeview">
              <a href="#"><i class="fa fa-map"></i> <span>Base Layers</span> <i class="fa fa-angle-left pull-right"></i></a>
               <ul class="treeview-menu">
	                <li><div id="baseLayersDiv"></div></li>
               </ul> 
            </li>
            
            <li class="treeview">
              <a href="#"><i class="fa fa-edit"></i> <span>Drawing Tools</span> <i class="fa fa-angle-left pull-right"></i></a>
               <ul class="treeview-menu">
	                <li><input type="checkbox" id="drawControlCheckboxId" data-toggle="toggle" data-on="Show" data-off="Hide"></li>
               </ul> 
            </li>
            
            <li><a href="#" id="searchAnchorId" data-toggle='control-SearchSideBar'><i class="fa fa-search"></i> <span>Search Places</span></a></li>
            <li id="shareDrawingsLI" style="display:none"><a href="#" id="shareAnchorId" data-toggle='control-ShareSideBar'><i class="fa fa-share-alt"></i> <span>Share Drawings</span></a></li>
            
            <li id="drawingsListLI" class="treeview" style="display:none">
              <a href="#" id="getDrawingsAnchorId"><i class="fa fa-bars"></i> <span>My Maps</span> <i class="fa fa-angle-left pull-right"></i></a>
               <ul id="drawingsListUL" class="treeview-menu">
	                <!-- <li><a href="#">Link in level 2</a></li>
	                <li><a href="#">Link in level 2</a></li> -->
	                
	                <li>  <div id="userDrawingsListDiv"></div> </li>
	                <li>  <div id="dispDrawingsCheckBoxDiv"> <ul id="includedDrawingsCheckBoxesUL"> </ul></div> </li>
               </ul> 
            </li>
            
            <li id="clearDrawingsLI" style="display:none"><a href="#" id="clearDrawingsAnchorId"><i class="fa fa-trash"></i> <span>Clear Drawings</span></a></li>

            <li id="startNewDrawingLI" class="treeview" style="display:none">
              <a href="#" id="newDrawingAnchorId"><i class="fa fa-plus-square"></i> <span>Start New Drawing</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu" id="includeDrawingsUL">
	            <li>  <div id="includeDrawingsListDiv"></div> </li>
              </ul>
            </li>
            
            
            <li id="saveDrawingLI" class="treeview" style="display:none">
              <a href="#"><i class="fa fa-save"></i> <span>Save Drawing</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li> <input type="text" name="drawingName" id="drawingNameId" class="form-control" placeholder="Drawing Name"> </li>
                <li>
                	<a href="#" id="saveDrawingsAnchorId"><i class="fa fa-save"></i> <span>Save Drawing</span></a>
                	<a href="#" id="saveAsNewDrawingsAnchorId"><i class="fa fa-paste"></i> <span>SaveAs New Drawing</span></a>
                </li>
              </ul>
            </li>
            
           
            
             <!-- draw controls, layers list -->
             
             
            <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu" style="height:200px;overflow: auto">
                <li><a href="#">Link in level 2</a></li>
                <li><a href="#">Link in level 2</a></li>
                <li><a href="#">Link in level 2</a></li>
                <li><a href="#">Link in level 2</a></li>
                <li><a href="#">Link in level 2</a></li>
              </ul>
            </li>

			<li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
			
            <li class="treeview">
             <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li>  <input type="button" id="searchButtonId" class="button slideout-search-toggle" style="visibility:visible" value="Search"/> </li>
                <li>  <input type="button" id="test" value="layers"/> </li>
                <li>  <input type="button" id="test1" value="layers-1"/> </li>
       			<li>  <input type="button" id="loginButtonId" class="button slideout-menu-toggle" style="visibility:visible" value="Login"/> </li>
				<li>  <input type="button" id="logoutButtonId" class="button" style="visibility:hidden" value="Logout"/> </li>
				<!-- <li>  <input type="button" id="saveDrawingsButtonId" class="button" value="Save Drawings"/> </li> -->
				<!-- <li>  <input type="button" id="getDrawingsButtonId" class="button" value="Get Drawings"/> </li> -->
				<!-- <li>  <input type="button" id="clearDrawingsButtonId" class="button" value="Clear Drawings"/> </li>
				<li>  <input type="button" id="newDrawingButtonId" class="button" value="New Drawing"/> </li> -->
				<li>  <input type="button" id="createGroupButtonId" class="button slideout-creategroup-toggle" value="Create Group" /> </li> <!-- style="visibility:hidden" -->
				<li>  <input type="button" id="shareButtonId" class="button slideout-share-toggle" style="visibility:visible" value="Share"/> </li>
				<li>  <input type="button" id="shareFeedButtonId" class="button slideout-sharingFeed-toggle" style="visibility:visible" value="Share Feed"/> </li>
				
				
				<!-- <li>  <div id="dispDrawingsCheckBoxDiv"></div> </li>
				<li>  <div id="userDrawingsListDiv"></div> </li> -->
				<!-- <li>  <div id="sharedDrawingsListDiv"></div> </li> -->
              </ul>
            </li>
            
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <!-- <section class="content-header">
          <h1>
            Page Header
            <small>Optional description</small>
            
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol>
        </section> -->

        <!-- Main content -->
        <section class="content">
			<div id="map"></div>
        </section><!-- /.content -->
        
      </div><!-- /.content-wrapper -->


		<!-- search slide -->
		<div class="slideout-search open">
			<h3>Search <a href="#" class="slideout-search-toggle">×</a></h3>
			<input type="text" id="searchBox" value="new york"/>
			<input type="button" id="searchButton" class="button" value="Search"/>
			
			<div id="searchResultsDiv" class="searchResults">
				Search Results<br/>
			</div>
		</div>


		<!-- create group slide -->
		<div class="slideout-creategroup open">
			<h3>Search <a href="#" class="slideout-creategroup-toggle">×</a></h3>
			<!-- <input type="text" id="groupNameTextBox" value=""/>
			<input type="button" id="createNewGroupButtonId" class="button" value="Create"/>
			
			<div id="userListDiv" class="searchResults">
				Users<br/>
			</div> -->	
		</div>

		<!-- share slide -->
		<div class="slideout-share open">
			<h3>Share <a href="#" class="slideout-share-toggle">×</a></h3>
			<!-- <input type="button" id="submitSharingButton" class="button" value="Share"/>
			<br/><br/>
			<select id ="drawingShareDropdown">
			</select>
			<br/><br/>
			<div id="userGroupsDiv" class="searchResults">
				Groups <br/>
			</div> -->
		</div>

		<!-- sharing feed slide -->
		<!-- <div class="slideout-sharingFeed open">
			<h3>Share Feed<a href="#" class="slideout-sharingFeed-toggle">×</a></h3>
			<br/><br/>
			<div id="sharingFeedDiv" class="searchResults">
				Groups <br/>
			</div>
		</div> -->

		<div class="slideout-menu open">
			<h3>Login <a href="#" class="slideout-menu-toggle">×</a></h3>
			<table>		
				<tbody>
					<tr>
						<td>User Id:</td>
						<td><input type="text" id="userId" value="e" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" id="password" value="e" /></td>
					</tr>
					<tr>
						<td><input type="button" id="buttonLogin" value="Login" /></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>




      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
      </footer>


	<!-- maps, notices, groups, users, templates -->
    
	<aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li class="active"><a href="#control-sidebar-maps-tab" data-toggle="tab" id="allDrawingsTabAnchor"><i class="fa fa-map"></i></a></li>
          <li><a href="#control-sidebar-notices-tab" data-toggle="tab"><i class="fa fa-edit"></i></a></li>
          <li><a href="#control-sidebar-users-tab" data-toggle="tab" id="usersTabAnchor"><i class="fa fa-user"></i></a></li>
          <li><a href="#control-sidebar-groups-tab" data-toggle="tab" id="groupsTabAnchor"><i class="fa fa-group"></i></a></li>
          <li><a href="#control-sidebar-templates-tab" data-toggle="tab"><i class="fa fa-clone"></i></a></li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
        
          <!-- Maps tab content -->
          <div class="tab-pane active" id="control-sidebar-maps-tab">
            <!-- <h3 class="control-sidebar-heading">Recent Activity</h3> -->
            <!-- <ul class="control-sidebar-menu">
              <li>
                <a href="javascript::;">
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
            </ul> --><!-- /.control-sidebar-menu -->
            
            
            <ul class="control-sidebar-menu" id="allDrawingsUl">

            </ul>
            
            
          </div><!-- /.tab-pane -->


		  <!-- Notices tab content -->
          <div class="tab-pane" id="control-sidebar-notices-tab">Notices Tab Content</div><!-- /.tab-pane -->
          
          <!-- Users tab content -->
          <div class="tab-pane" id="control-sidebar-users-tab">
          
	          <form>
	            <input type="text" id="newuserFirstName" class="form-control" placeholder="First Name"/> 
				<input type="text" id="newuserLastName" class="form-control" placeholder="Last Name"/>
				<input type="text" id="newuserTitle" class="form-control" placeholder="Title"/>
				<input type="text" id="newuserEmail" class="form-control" placeholder="email"/>
				<input type="text" id="newuserUserId" class="form-control" placeholder="User Id"/>
				<input type="text" id="newuserPassword" class="form-control" placeholder="Password"/>
				<button type="submit" id="createUserButton" class="btn btn-default"><i>Create</i></button>
				
				<br/>
				
				Users List
				<ul id="existingUsersListUl" class="list-group">
				</ul>
				
	          </form>
          </div><!-- /.tab-pane -->
                   
          <!-- Groups tab content -->
          <div class="tab-pane" id="control-sidebar-groups-tab">Groups <br />
	          	<input type="text" id="groupNameTextBox" value=""/>
				<input type="button" id="createNewGroupButtonId" class="button" value="Create"/>
				
				Users<br/>
				<div id="userListDiv" class="searchResults">
					
				</div>
          </div><!-- /.tab-pane -->


          <!-- Templates tab content -->
          <div class="tab-pane" id="control-sidebar-templates-tab">
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked>
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
          
        </div>
      </aside><!-- /.control-sidebar -->
      
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
      
      
      <!-- Control Sidebar -->
      <aside class="control-SearchSideBar control-sidebar-dark">
        
          <!-- Search tab content -->
          <div class="tab-pane active" id="control-sidebar-searchPlaces-tab">
            <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          </div><!-- /.tab-pane -->
          
          
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
      
      
      
      <!-- Control Sidebar -->
      <aside class="control-ShareSideBar control-sidebar-dark">
      
   		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          	<li class="active"><a href="#control-sidebar-shareNew-tab" data-toggle="tab"><i class="fa fa-share"></i></a></li>
			<li><a href="#control-sidebar-shared-tab" data-toggle="tab"><i class="fa fa-share-alt"></i></a></li>
          	<li><a href="#control-sidebar-shareFeed-tab" data-toggle="tab"><i class="fa fa-rss"></i></a></li>
        </ul>
      
      	<div class="tab-content">
          <div class="tab-pane active" id="control-sidebar-shareNew-tab">
            Share Any Drawing<br />
            
            <input type="button" id="submitSharingButton" class="button" value="Share"/>
			<br/><br/>
			<select id ="drawingShareDropdown">
			</select>
			<br/><br/>
			<div id="userGroupsDiv" class="searchResults">
				Groups <br/>
			</div>
          </div>
          
          
          <div class="tab-pane" id="control-sidebar-shared-tab">
          	Shared Tab Content
       		<div id="sharedDrawingsListDiv"></div>
          </div>
          
          <div class="tab-pane" id="control-sidebar-shareFeed-tab">Share Feed Tab Content
          	<!-- <div id="sharingFeedDiv" class="searchResults">
				Groups <br/>
			</div> -->
			
			<ul id="shareFeedULGroup" style="margin:0; padding: 0; height: 250px; overflow: auto">
				
			</ul>
			
			<ul id="shareFeedULSelf" style="margin:0; padding: 0; height: 250px; overflow: auto">
				
			</ul>
			
			
          </div>
        </div>  
      </aside><!-- /.control-sidebar -->
      
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
      
      
      
    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="<spring:url value="/resources/UI/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<spring:url value="/resources/UI/bootstrap/js/bootstrap.min.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<spring:url value="/resources/UI/dist/js/app.js"/>"></script>

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
         
         
   	<script src="<spring:url value="/resources/JS/lightbox.js"/>"></script>
	
	<script>
	    lightbox.option({
	      'resizeDuration': 400,
	      'wrapAround': true
	    });
	</script>
	
	<script type="text/javascript">
	
		var map = L.map('map', {editable: true}).setView([39.505, -77.09], 6);

		/* base layers */
		/* var mapBoxLayer = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
			    maxZoom: 18,
			    id: 'sudheerpitchika.ciep2uaqn0ituskkmmyu1j6ps',
			    accessToken: 'pk.eyJ1Ijoic3VkaGVlcnBpdGNoaWthIiwiYSI6ImNpZXAydWJlcTBpeWNzMm0ycW10OTVpbmEifQ.z2zCTc_8_5R9JBxM1eFpmg'
				});
		var mapquestLayer = new L.TileLayer('http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png', {maxZoom: 18, subdomains: ['otile1','otile2','otile3','otile4']});
		var osmLayer = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { maxZoom: 18 });	//styleId: 997,
		var g_roadmap = new L.Google('ROADMAP');
		var g_satellite = new L.Google('SATELLITE');
		var g_terrain = new L.Google('TERRAIN');
		var Esri_WorldStreetMapLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}');
		var Esri_DeLormeLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Specialty/DeLorme_World_Base_Map/MapServer/tile/{z}/{y}/{x}', {
			minZoom: 1,
			maxZoom: 11
		});

		var Esri_WorldTopoMapLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}');
		var Esri_WorldImageryLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}');
		var Esri_WorldTerrainLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 13
		});
		var Esri_WorldShadedReliefLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 13
		});
		var Esri_WorldPhysicalLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 8
		});
		var Esri_OceanBasemapLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 13
		});
		var Esri_NatGeoWorldMapLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 16
		});
		var Esri_WorldGrayCanvasLayer = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}', {
			maxZoom: 16
		}); */


		
/* 		var HERE_normalDayTransitLayer = L.tileLayer('http://{s}.{base}.maps.cit.api.here.com/maptile/2.1/{type}/{mapID}/normal.day.transit/{z}/{x}/{y}/{size}/{format}?app_id={app_id}&app_code={app_code}&lg={language}', {
			attribution: 'Map &copy; 1987-2014 <a href="http://developer.here.com">HERE</a>',
			base: 'base',
			type: 'maptile'
		}); */
		
//		map.addLayer(g_satellite);
		
		//g_roadmap.setOpacity(0.6);
		//g_satellite.setOpacity(0.6);
		//g_terrain.setOpacity(0.6);
		
//		map.addLayer(mapquestLayer);
		
		
		/* add base layers to layers group */
/* 		var roadmap =L.layerGroup([g_roadmap]);
		var satellite = L.layerGroup([g_satellite]);
		var terrain =L.layerGroup([g_terrain]);
		var mapBox = L.layerGroup([mapBoxLayer]);
		var mapquest = L.layerGroup([mapquestLayer]);
		var osm = L.layerGroup([osmLayer]);
		var Esri_WorldStreetMap = L.layerGroup([Esri_WorldStreetMapLayer]);
		var Esri_DeLorme = L.layerGroup([Esri_DeLormeLayer]);
		var Esri_WorldTopoMap = L.layerGroup([Esri_WorldTopoMapLayer]);
		var Esri_WorldImagery = L.layerGroup([Esri_WorldImageryLayer]);
		var Esri_WorldTerrain = L.layerGroup([Esri_WorldTerrainLayer]);
		var Esri_WorldShadedRelief = L.layerGroup([Esri_WorldShadedReliefLayer]);
		var Esri_WorldPhysical = L.layerGroup([Esri_WorldPhysicalLayer]);
		var Esri_OceanBasemap = L.layerGroup([Esri_OceanBasemapLayer]);
		var Esri_NatGeoWorldMap = L.layerGroup([Esri_NatGeoWorldMapLayer]);
		var Esri_WorldGrayCanvas = L.layerGroup([Esri_WorldGrayCanvasLayer]); */

/* 		var HERE_normalDayTransit = L.layerGroup([HERE_normalDayTransitLayer]); */
		
		/* add them to display list with radio button */
		/* var layers = {
			"Roadmap" : roadmap,
			"Satellite" : satellite,
			"Terrain" : terrain,
			"MapBox" : mapBox,
			"MapQuest": mapquestLayer,
			"OSM" : osm,
			"WorldStreetMap" : Esri_WorldStreetMap,
			"DeLorme" : Esri_DeLorme,
			"WorldTopoMap" : Esri_WorldTopoMap,
			"WorldImagery" : Esri_WorldImagery,
			"WorldTerrain" : Esri_WorldTerrain,
			"WorldShadedRelief" : Esri_WorldShadedRelief,
			"WorldPhysical" : Esri_WorldPhysical,
			"OceanBasemap" : Esri_OceanBasemap,
			"NatGeoWorldMap" : Esri_NatGeoWorldMap,
			"WorldGrayCanvas" : Esri_WorldGrayCanvas,
 		//	"normalDayTransit" : HERE_normalDayTransit, 
		}; */

		//add layer control
/* 		var controls = L.control.layers(layers);		
		controls.addTo(map); */		

 		getBaseLayers();
		
		
 		var	drawnItems = L.featureGroup().addTo(map);
 		drawnItems.on('click', function(e) { layerClicked(e.layer); });
 		
 		
// 		drawnItems.on('mouseover', function(e) { layerMouseover(e.layer); });
// 		drawnItems.on('mouseout', function(e) { layerMouseout(e.layer); });

 		
/*  		var higherOpacity = new L.Control.higherOpacity();
 		map.addControl(higherOpacity);
 		var lowerOpacity = new L.Control.lowerOpacity();
 		map.addControl(lowerOpacity);
 		var opacitySlider = new L.Control.opacitySlider();
 		map.addControl(opacitySlider);
 */ 		
 		
/*  		var editableLayers = new L.FeatureGroup();
 		map.addLayer(editableLayers);
 		
 		var MyCustomMarker = L.Icon.extend({
 		    options: {
 		        shadowUrl: null,
 		        iconAnchor: new L.Point(12, 12),
 		        iconSize: new L.Point(24, 24),
 		        iconUrl: 'link/to/image.png'
 		    }
 		});
 		
 		
 		var options = {
 			    position: 'topright',
 			    draw: {
 			        polyline: {
 			            shapeOptions: {
 			                color: '#f357a1',
 			                weight: 10
 			            }
 			        },
 			        polygon: {
 			            allowIntersection: false, // Restricts shapes to simple polygons
 			            drawError: {
 			                color: '#e1e100', // Color the shape will turn when intersects
 			                message: '<strong>Oh snap!<strong> you can\'t draw that!' // Message that will show when intersect
 			            },
 			            shapeOptions: {
 			                color: '#bada55'
 			            }
 			        },
 			        circle: false, // Turns off this drawing tool
 			        rectangle: {
 			            shapeOptions: {
 			                clickable: false
 			            }
 			        },
 			        marker: {
 			            icon: new MyCustomMarker()
 			        }
 			    },
 			    edit: {
 			        featureGroup: editableLayers, //REQUIRED!!
 			        remove: false
 			    }
 			};

 			var drawControl = new L.Control.Draw(options);
 			map.addControl(drawControl); */
 			
 		
 		// default colors for shapes
		var drawControl = new L.Control.Draw({
			   draw: {
			    polygon: {
			     shapeOptions: {
			      color: 'purple'
			     },
			    },
			    polyline: {
			     shapeOptions: {
			      color: 'red'
			     },
			    },
			    rect: {
			     shapeOptions: {
			      color: 'green'
			     },
			    },
			    circle: false
			    /* circle: {
			     shapeOptions: {
			      color: 'steelblue'
			     },
			    }, */
			   },
			   edit: {
			    featureGroup: drawnItems
			   }
			  });
			 // map.addControl(drawControl);
			  
			  
		  /* save properties for shapes from pop up */
		  function saveIdIW() {

		  		// attributes name, desc, date
			     var sName = $('#shapeName').val();
			     var sDesc = $('#shapeDesc').val();
				 var sDate = $('#shapeDate').val();
				 
			     //var drawings = drawnItems.getLayers();  //drawnItems is a container for the drawn objects
			     //var layer = drawings[drawings.length - 1];
			    

			    var layer = popUpLayer;
			    var fea = layer.feature;
				var props;

				// get the properties from the layers
				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= layer.props;
				
				// save them in the properties of shape
			     props.title = sName;
			     props.desc = sDesc;
				 props.date = sDate;
				 // opacity slider
			     props.opacity = parseFloat($('#slidernumber').html());
			     layer.options.opacity = parseFloat($('#slidernumber').html());
			     layer.options.fillOpacity = parseFloat($('#slidernumber').html());
			     

			     // show label for marker on hover (mouse move)
				 if(props.type=="marker" && sName.length > 0){
					 layer.unbindLabel();
					 layer.bindLabel(sName);
					 layer.setLabelNoHide(true);
				 }
			     
			     // close popup
			     if (idIW) {
			        map.closePopup();
			     }
			     
			     // remove layer, and add it back (with updated opacity)
			     // not working in all cases
			     drawnItems.removeLayer(layer);
			     drawnItems.addLayer(layer);
			     console.log(layer);
			     popUpLayer = null;
			}
		  
		  // get the place for the pop up to display, from the properties of shape
		  function getpopUpCenter(){
			  
  			  var fea = popUpLayer.feature;
			  var props;

			  if(typeof(fea)!="undefined")
				 props = fea.props;
			  else
				 props= popUpLayer.props;
				
			  var type = props.type;
			  
			  if(type=='marker' || type=='circle'){
				  return popUpLayer.getLatLng(); 
			  }
			  if(type=='rectangle' || type == 'polygon' || type=='polyline'){
				  return popUpLayer.getLatLngs()[0];
			  }
		  }
		  
		  // get the area for circle, square or polygon
		  // get length for line, latlang for marker
		  function setAreaOrDistance(layer){
			  
			  var fea = layer.feature;
				var props;

				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= layer.props;
				
			 var type = props.type;
			 
			 
			 if(type=="polygon" || type=="rectangle"){
					// area using the built in function L.GeometryUtil.geodesicArea
				 	var area = L.GeometryUtil.geodesicArea(layer.getLatLngs());
				 	console.log("area "+area);
				 	props.measure = area;
				 }
				 else if (type === 'circle') {
				 	// area using formula
				     var area = 0;
				     var radius = layer.getRadius();
				     area = (Math.PI) * (radius * radius);
				     props.measure = ((area / 1000000).toFixed(2) + ' km<sup>2</sup>');
				}
				 else if (type=="polyline"){
				 	// length of line by calculating distance between all consecutive points in poly-line 					 
					var tempLatLng = null;
				    var totalDistance = 0.00000;
				    $.each(layer._latlngs, function(i, latlng){
				        if(tempLatLng == null){
				            tempLatLng = latlng;
				            return;
				        }
				        totalDistance += tempLatLng.distanceTo(latlng);
				        tempLatLng = latlng;
				    });
				    console.log("line dist "+(totalDistance).toFixed(2));
				    props.measure = (totalDistance).toFixed(2) + ' meters';
				 }
		  }
	     
	     function getPopupMarkup(){
	     	// add all these values to the pop up

	    	 return    '<span><b>Name: </b></span>'
					  +'<input id="shapeName" type="text"/><br/><br/>'
					  
		 			  +'<span><b>Desc: <b/></span>'
		 			  +'<textarea id="shapeDesc" cols="20" rows="3"></textarea><br/><br/>'
		 			  
		 			  +'<span><b>Date: <b/></span>'
		 			  +'<input type="text" id="shapeDate"/><br/><br/>'
		 			  
		 			  +'<label id="sizeMeasure"></label>'
		 			  +'<label id="sizeValue" style="font-weight: normal !important;"></label> <br/><br/>'
		 			  +'<input id="opacitySlider" type ="range" min ="0" max="1.0" step ="0.1"/>'
		 			  +'<span id="slidernumber">1</span>'
		 			  +'<input type="file" name="file" id="fileLoader" /><br/>'
		 			  +'<input type="button" id="fileSubmit" value="Upload"/><br/><br/>'
		 			  
		 			  +'<a id="imageAnchor" class="example-image-link" href="" data-lightbox="Image"> <img id="imageHolder" src="" alt="Deleted"/></a> <br/><br/>'
		 			  
		 			  +'<input type="button" id="okBtn" value="Save" onclick="saveIdIW()"/>';
	    	 
	     }
	     
	     // after editing the layers and save the edits, calculate the distance or area of each shape 
		  map.on('draw:edited', function(event) {
			  editedLayers = event.layers;
			  editedLayers.eachLayer(function(layer){
				  setAreaOrDistance(layer);
			  });
		  });

		  // when 'edit' button is clicked
		  map.on('draw:editing', function() {
			  drawnItems.eachLayer(function(layer){
					var fea = layer.feature;
					var props;
					
					if(typeof(fea)!="undefined")
						props = fea.props;
					else
						props= layer.props;

					// enable only for the current user drawing
					// disable editing for included drawings
					if(drawingId != props.drawingId){
						layer.editing.disable();
					}
				});
		  });
		  
		 // when new shape is created
		 map.on('draw:created', function(event) {
		     
			 var  type = event.layerType, layer = event.layer;
			 //var geoJSON = layer.toGeoJSON();

			 // add properties placeholders
			 layer.props = {};
			 layer.props.type = type;
			 layer.props.drawingId = drawingId;
			 
			 //layer.props.color = getColor(type);
			 layer.props.opacity = 0.7;
			 popUpLayer = layer;

			 // create popup for the new shape
			 idIW = L.popup();
		     var content = getPopupMarkup(); 
		     // popup contents		     				
		     idIW.setContent(content);
		     idIW.setLatLng(getpopUpCenter()); //calculated based on the e.layertype
		     idIW.openOn(map);

		     // opacity slider in popup
		     $('#opacitySlider').on("change mousemove", function() {
		    	    $('#slidernumber').html($(this).val());
		    });
		     $("input[type=range]").val(0.7);
		     $("#slidernumber").text("0.7");
		     

			 if (type === "circle") {
			        var radius = layer.getRadius();
			        layer.props.radius = radius;
			 }
			 
			 // area or distance for the shape
			 setAreaOrDistance(layer);
			 
			 // display latlang for marker, length for line, area for circle, rectangle or polygon  
		     var measure = layer.props.measure;
			 if(typeof(measure)!="undefined"){
			     if(type=="circle" || type=="rectangle" || type == "polygon")	 
				 {
				 	$( '#sizeMeasure').text('Area: ');
				 	$( '#sizeValue').text(measure);
				 }
				 else if(type=="polyline"){
					 $( '#sizeMeasure').text('Dist: ');
					 $( '#sizeValue').text(measure);
				 }
			 }
			 
			 if(type=="marker"){
				 $( '#sizeMeasure').text('Lat: '+layer.getLatLng().lat);
			 	 $( '#sizeValue').html('<br /><b>Lng: '+layer.getLatLng().lng+'</b>');
			 }

			// add date picker to popup 
			$(function() {
			    $( "#shapeDate" ).datepicker();
			});

			console.log(layer);
			drawnItems.addLayer(layer);

		});
		
		// open popup for marker on mouse over
		function layerMouseover(layer){

			var fea = layer.feature;
			var props;

			if(typeof(fea)!="undefined")
				props = fea.props;
			else
				props= layer.props;
			
			var type = props.type;
			if(type == "marker"){
				if(typeof(props.title)!="undefined"){
					layer.bindPopup(props.title);
					layer.openPopup();
				}
			}
		}
		// close popup for marker on mouse out
		function layerMouseout(layer){

			var fea = layer.feature;
			var props;

			if(typeof(fea)!="undefined")
				props = fea.props;
			else
				props= layer.props;
			
			var type = props.type;
			if(type == "marker"){
				layer.closePopup();
			}
		}
		
		// open popup when user clicked on shape (layer)
		function layerClicked(layer){
			
			popUpLayer = layer;

			var fea = layer.feature;
			var props;

			if(typeof(fea)!="undefined")
				props = fea.props;
			else
				props= layer.props;
			
			var type = props.type;
			var image = props.image;
			
			 idIW = L.popup();
		     var content = getPopupMarkup();
		     idIW.setContent(content);
		     idIW.setLatLng(getpopUpCenter()); //calculated based on the e.layertype
		     idIW.openOn(map);
		     
		     $('#opacitySlider').on("change mousemove", function() {
		    	    $('#slidernumber').html($(this).val());
		    	    //layer.options.opacity = parseFloat($(this).val());
		    });
		     
		     $("input[type=range]").val(props.opacity);
		     $("#slidernumber").text(props.opacity);

		     
		     var measure = props.measure;
			 if(typeof(measure)!="undefined"){
			     if(type=="circle" || type=="rectangle" || type == "polygon")	 
				 {
				 	$( '#sizeMeasure').text('Area: ');
				 	$( '#sizeValue').text(measure);
				 }
				 else if(type=="polyline"){
					 $( '#sizeMeasure').text('Distance: ');
					 $( '#sizeValue').text(measure);
				 }
			 }
			 
			if(type=="marker"){
				$( '#sizeMeasure').text('Lat: '+layer.getLatLng().lat);
			 	$( '#sizeValue').html('<br /><b>Lng: '+layer.getLatLng().lng+'</b>');
			}
			
			$(function() {
			    $( "#shapeDate" ).datepicker();
			});
			
		     $('#shapeName').val(props.title);
		     $('#shapeDesc').val(props.desc);
		     $('#shapeDate').val(props.date);
		    
		     if(typeof(image)!= "undefined"){
				var url = "${pageContext.request.contextPath}";
				var imagePath = url+'/'+image;
			    $('#imageHolder').attr('src',imagePath).height(60).width(60);
			    $('#imageAnchor').attr('href',imagePath);
		     }
		}
	
		

		
		
	</script>

      
  </body>
</html>
