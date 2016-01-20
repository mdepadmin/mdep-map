/**
 * 
 */
var userGroupsAndSharedDrawings;
var userGroupsDetails;
var tt;

function showForm(){
	$('#loginForm').toggle(1000);
}



// call to get the search results based on a search term
function getSearchResults(url, callback){
	$.ajax({
/*	    headers: {
	        'Access-Control-Allow-Origin':'*',
	        'Content-Type':'application/json; charset=UTF-8'
	    },*/
	    beforeSend: function (request)
        {
	    	// change the Access-Control-Allow-Origin to allow to make a call to different server
            request.setRequestHeader("Access-Control-Allow-Origin", "*");
        },
        url: url,
	    type: 'GET',
	    success: function(data){
	    	tt= data;
	      console.log('succes');
	      // call back if success
	      callback(data);
	    },
	    error:function(message){
	    	tt= message;
	    	console.log('failure: '+message);
	    }
	  });
}

// get the userId, password fields and pass them to the service to check  
function checkCredentials(inUrl,callback){
	var userId = $('#userId').val();
	var password = $('#password').val();
	
	var json = {"userId":userId, "password":password};
	var jsonData = JSON.stringify(json);

	// call login.json service using POST method
	var url = inUrl+"/logincontroller/login.json";
	
	$.ajax({
		url: url,
		data: jsonData,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(user){
			console.log(user);
			// callback on successful login
			if(user!="")
				callback(user);
		},
	    failure:function(user){
	    }
	});
}

// logout the current user
function logoutUser(inUrl,callback){
	var url = inUrl+"/logincontroller/logout";

	// no data to be sent, the url would do
	$.ajax({
		url: url,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'charset=utf-8' 
	    },
	    
		success:function(message){
			console.log(message);
			
			if(message == true)
				$('#message').text("Logged out");
				
			else if(message == false)
				$('#message').text("Error-1");
			
			callback();
		},
	    failure:function(message){
			$('#message').text("Error-2");
	    }
	});
}

// save the user drawings (shapes, zoom level, center etc)
function saveDrawings(inUrl, map, drawnItems, callback){
	
	var len = drawnItems.getLayers().length;
	
	// convert to GeoJSON object to extract all shapes and meta data
	var geo = drawnItems.toGeoJSON();
	
	// get features size from json where all shapes data is stores
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);

	// variable to store all included drawing Ids
	var includes = [];

	
	for(var i=0; i<len;i++){
		
		// get each layer from the currently displaying drawings
		var curLayer = drawnItems.getLayers()[i];
		var fea = curLayer.feature;
		var props;
		
		// differentiate the new drawings or loaded drawings (for new drawings curLayer.feature doesn't exists)
		// props is for METADATA of shape (added when the shape was drawn)
		if(typeof(fea)!="undefined")
			props = fea.props;
		else
			props= curLayer.props;

		// to get display options such as color, opacity etc 
		var options = curLayer.options;
		
		console.log("drawing id: "+props.drawingId);
		
		// only for the new drawing (props.drawingId == 0) or loaded drawing (props.drawingId == drawingId), not the included ones
		if(props.drawingId == 0 || props.drawingId == drawingId){
			console.log(props.drawingId + " "+props.type);
			
			// add all the properties and options to the layer to be saved
			var layerGeo = curLayer.toGeoJSON();
			layerGeo.props = {};
			layerGeo.props.drawingId = "";
			layerGeo.props.type = props.type;
			layerGeo.props.desc = props.desc;
			layerGeo.props.title = props.title;
			layerGeo.props.date = props.date;
			layerGeo.props.measure = props.measure;
			layerGeo.props.image = props.image;
			layerGeo.props.color = options.color;
			layerGeo.props.opacity = options.opacity;
			
			if(props.type == 'circle'){
	//			console.log(curLayer.props.radius);
				layerGeo.props.radius = curLayer.props.radius;
			}
	//		console.log(layerGeo);
	//		drawnItems.removeLayer(curLayer);
			
			// add the layer to the parent object
			geo.features.push(layerGeo);
		}
		else{
			// included drawings, saving only Ids
			includes.push(props.drawingId); 
		}
	}
	
	var url = inUrl+"/drawshapescontroller/saveDrawings";
	
	// removed the duplicates (if any) and add it to parent object
	var uniqueIncludes = includes.filter( onlyUnique );
	geo.includeDrawings = uniqueIncludes;
	
	console.log(geo);

	var json = {"userId":'', "jsonData":JSON.stringify(geo), "jsonCenter":JSON.stringify(map.getCenter()), "zoomLevel":map.getZoom()};
	var jsonData = JSON.stringify(json);

	console.log(jsonData);
	
	$.ajax({
		url: url,
		data: jsonData,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: "+message);
			
			// once successfully saved, set the returned drawingId to the new drawing
			for(var i=0; i<len;i++){
				var curLayer = drawnItems.getLayers()[i];
				var fea = curLayer.feature;
				var props;
				
				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= curLayer.props;
				
				// if there is a new drawing (unsaved), set  its drawingId
				if(props.drawingId==0)
					props.drawingId = message;
			}
			if(callback)
				callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}

// remove duplicates
function onlyUnique(value, index, self) { 
    return self.indexOf(value) === index;
}

// to update the drawings 
// same as save drawing method (updates already saved drawing, no new drawing but new shapes will be included)
function updateDrawings(inUrl, map, drawingId, drawnItems, callback){
	
	var len = drawnItems.getLayers().length;
	
	// convert to GeoJSON object to extract all shapes and meta data
	var geo = drawnItems.toGeoJSON();
	
	// get features size from json where all shapes data is stores	
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);
	
	// variable to store all included drawing Ids
	var includes = [];
	
	for(var i=0; i<len;i++){
		
		// get each layer from the currently displaying drawings
		var curLayer = drawnItems.getLayers()[i];
		var type;
		var title, desc;
		var props;
		//console.log(curLayer);
		
		//has feature - existing (loaded) shape
		var fea = curLayer.feature;
		
		// differentiate the new drawings or loaded drawings (for new drawings curLayer.feature doesn't exists)
		// props is for METADATA of shape (added when the shape was drawn)
		if(typeof(fea)!="undefined")
			props = fea.props;
		else
			props= curLayer.props;

		// to get display options such as color, opacity etc 
		var options = curLayer.options;

		// only for the new drawing (props.drawingId == 0) or loaded drawing (props.drawingId == drawingId), not the included ones
		if(props.drawingId == 0 || props.drawingId == drawingId){
			
			
			type = props.type;
			title = props.title;
			desc = props.desc;
			
			var layerGeo = curLayer.toGeoJSON();
			
			// add all the properties and options to the layer to be saved			
			layerGeo.props = {};
			layerGeo.props.drawingId = drawingId;
			layerGeo.props.type = type;
			layerGeo.props.desc = desc;
			layerGeo.props.title = title;
			layerGeo.props.date = props.date;
			layerGeo.props.measure = props.measure;
			layerGeo.props.image = props.image;
			layerGeo.props.color = options.color;
			layerGeo.props.opacity = options.opacity;
			
			if(type == 'circle'){
	//			console.log(curLayer.props.radius);
				layerGeo.props.radius = curLayer.props.radius;
			}
	//		console.log(layerGeo);
	//		drawnItems.removeLayer(curLayer);
			
			// add the layer to the parent object
			geo.features.push(layerGeo);
		}
		else{
			// included drawings, saving only Ids
			includes.push(props.drawingId);
		}
	}
	
	// removed the duplicates (if any) and add it to parent object
	var uniqueIncludes = includes.filter( onlyUnique );
	geo.includeDrawings = uniqueIncludes;
	var url = inUrl+"/drawshapescontroller/updateDrawings";
	
	console.log(geo);
	
	var json = {"drawingId":drawingId,"userId":'', "jsonData":JSON.stringify(geo), "jsonCenter":JSON.stringify(map.getCenter()), "zoomLevel":map.getZoom()};
	var jsonData = JSON.stringify(json);
//	console.log("-----------"+json);
//	console.log("***********"+jsonData);
	
	
	$.ajax({
		url: url,
		data: jsonData,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: "+message);
			
			// once successfully saved, set the returned drawingId to the new drawing			
			for(var i=0; i<len;i++){
				var curLayer = drawnItems.getLayers()[i];
				var fea = curLayer.feature;
				var props;
				
				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= curLayer.props;
				
				// if there is a new drawing (unsaved), set  its drawingId
				if(props.drawingId==0)
					props.drawingId = drawingId;
			}
			
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}




// toggles (show/hide) slide
function toggleSlide(slide){
	// create menu variables
//	var slideoutMenu = $('.slideout-menu');	
	var screenSize = $(window).width();
	var leftPx = screenSize+"px";
	
//	$('.slideout-menu').css("left",leftPx);
	slide.css("left",leftPx);
	
	// slide menu
	if (slide.hasClass("open")) {
		openSlide(slide);
	} else {
		closeSlide(slide);
	}
}

// close slide, changing visibility to "hidden"
function closeSlide(slide){
	var slideoutMenu = slide;
	var screenSize = $(window).width();
	slideoutMenu.toggleClass("open");
	
	slide.css("visibility","hidden");
	slideoutMenu.animate({
    	left: screenSize
	}, 200);
}

// open slide, changing visibility to "visible"
function openSlide(slide){
	var slideoutMenu = slide;
	var slideoutMenuWidth = slide.width();
	
	var screenSize = $(window).width();	
	var leftStart = screenSize - slideoutMenuWidth;
	leftStart = leftStart + "px";
	
	slideoutMenu.toggleClass("open");
	slide.css("visibility","visible");
	slideoutMenu.animate({
    	left: leftStart
	}, 200);
}


// get the user drawings
function getDrawings(inUrl, callback){

	var url = inUrl+"/drawshapescontroller/getDrawings";
	
	// no data to be sent, the url would do
	$.ajax({
		url: url,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			// call back upon successful service call
			console.log("Success: "+message);
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}

// get the list of users for this applications
function getUsersList(inUrl, callback){

	var url = inUrl+"/logincontroller/getUsersList";
	console.log(url);
	
	$.ajax({
		url: url,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: UserList");
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}

// get the list of base layers from the database
function getBaseLayersFromService(inUrl, callback){

	var url = inUrl+"/baselayerscontroller/getBaseLayers";
	
	$.ajax({
		url: url,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: Fetched layers ");
			tt=message;
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}


// save the new group in db, pass the list of users to be included in this group and name of the group
// groupId will be generated  in db, adminId will be the currently logged in user (added in backend)
function createNewGroup(inUrl, groupName, selectedUsers, callback){
	
	var url = inUrl+"/groupscontroller/createNewGroup";

	var json = {"groupId":"","groupName": groupName, "groupMembersJSON":JSON.stringify(selectedUsers), "adminId":"", "groupMembers":selectedUsers};
	var jsonData = JSON.stringify(json);
	
	$.ajax({
		url: url,
		type:"POST",
		data: jsonData,
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: group created "+message);
			tt=message;
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}


// get the list of groups the current user is part of, and the drawings shared to that group
// groups can be extracted from the returned object,  like message.userGroups 
function getUserGroupsAndShareDrawings(inUrl, callback){

	var url = inUrl+"/groupscontroller/getUserGroupsAndShareDrawings";
	
	$.ajax({
		url: url,
		type:"POST",
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: User Groups");
			userGroupsAndSharedDrawings=message;
			userGroupsDetails = message.userGroups;
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}

// share a drawing with members or groups
// pass drawingId, groups to be shared with, and members to be shared with
function submitSharingRequest(inUrl, shareDrawingId, shareWithGroups, shareWithMembers, callback){
	
	var url = inUrl+"/groupscontroller/shareDrawing";
	
	var json = {"sharingId":"","sharedByUser":"","sharedDrawingId":shareDrawingId,"sharedWithGroups": shareWithGroups, "sharedWithMembers":shareWithMembers};	// ,"sharedTime":""
	var jsonData = JSON.stringify(json);
	
	$.ajax({
		url: url,
		type:"POST",
		data: jsonData,
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: Shared "+message);
			tt=message;
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}


// get the drawings shared to the user by sending shared drawing Ids, (got these ids from getUserGroupsAndShareDrawings method)
function getSharedDrawings(inUrl,sharedIdsUnique,callback){
	
	console.log(sharedIdsUnique);
	var url = inUrl+"/drawshapescontroller/getDrawingsList";
	
	var json = sharedIdsUnique;
	var jsonData = JSON.stringify(json);
	
	$.ajax({
		url: url,
		type:"POST",
		data: jsonData,
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json; charset=utf-8' 
	    },
	    
		success:function(message){
			console.log("Success: SharedDrawingsList "+message);
			tt=message;
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}