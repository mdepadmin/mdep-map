/**
 * 
 */
var userGroupsAndSharedDrawings;
var userGroupsDetails;
var tt;

function showForm(){
	$('#loginForm').toggle(1000);
}

function getSearchResults(url, callback){
	$.ajax({
/*	    headers: {
	        'Access-Control-Allow-Origin':'*',
	        'Content-Type':'application/json; charset=UTF-8'
	    },*/
	    beforeSend: function (request)
        {
            request.setRequestHeader("Access-Control-Allow-Origin", "*");
        },
        url: url,
	    type: 'GET',
	    success: function(data){
	    	tt= data;
	      console.log('succes');
	      callback(data);
	    },
	    error:function(message){
	    	tt= message;
	    	console.log('failure: '+message);
	    }
	  });
}

function checkCredentials(inUrl,callback){
	var userId = $('#userId').val();
	var password = $('#password').val();
	
	var json = {"userId":userId, "password":password};
	var jsonData = JSON.stringify(json);

	var url = inUrl+"/team/login.json";
	
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
			if(user!="")
				callback(user);
		},
	    failure:function(user){
	    }
	});
}

function logoutUser(inUrl,callback){
	var url = inUrl+"/team/logout";
	
	$.ajax({
		url: url,
//		data: jsonData,
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


function saveDrawings(inUrl, map, drawnItems, callback){
	
	var len = drawnItems.getLayers().length;
	var geo = drawnItems.toGeoJSON();
	
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);

	
	var includes = [];
	
	for(var i=0; i<len;i++){
		var curLayer = drawnItems.getLayers()[i];
		
		
		var fea = curLayer.feature;
		var props;
		
		if(typeof(fea)!="undefined")
			props = fea.props;
		else
			props= curLayer.props;

		
		var options = curLayer.options;
		
		console.log("drawing id: "+props.drawingId);
		
		if(props.drawingId == 0 || props.drawingId == drawingId){
			console.log(props.drawingId + " "+props.type);	
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
			
			geo.features.push(layerGeo);
		}
		else{
			includes.push(props.drawingId); 
		}
	}
	
	var url = inUrl+"/team/saveDrawings";
	
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
			for(var i=0; i<len;i++){
				var curLayer = drawnItems.getLayers()[i];
				var fea = curLayer.feature;
				var props;
				
				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= curLayer.props;
				
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

function onlyUnique(value, index, self) { 
    return self.indexOf(value) === index;
}

function updateDrawings(inUrl, map, drawingId, drawnItems, callback){
	
	var len = drawnItems.getLayers().length;
	var geo = drawnItems.toGeoJSON();
	
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);
	var includes = [];
	
	for(var i=0; i<len;i++){
		var curLayer = drawnItems.getLayers()[i];
		var type;
		var title, desc;
		var props;
		var options = curLayer.options;
		//console.log(curLayer);
		
		//has feature - old shape
		var fea = curLayer.feature;
		
		if(typeof(fea)!="undefined")
			props = fea.props;
		else
			props= curLayer.props;
			
		if(props.drawingId == 0 || props.drawingId == drawingId){
			
			
			type = props.type;
			title = props.title;
			desc = props.desc;
			
			var layerGeo = curLayer.toGeoJSON();
			
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
			
			geo.features.push(layerGeo);
		}
		else{
			includes.push(props.drawingId);
		}
	}
	var uniqueIncludes = includes.filter( onlyUnique );
	geo.includeDrawings = uniqueIncludes;
	var url = inUrl+"/team/updateDrawings";
	
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
			
			for(var i=0; i<len;i++){
				var curLayer = drawnItems.getLayers()[i];
				var fea = curLayer.feature;
				var props;
				
				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= curLayer.props;
				
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

function closeSlide(slide){
	var slideoutMenu = slide;
	var screenSize = $(window).width();
	slideoutMenu.toggleClass("open");
	
	slide.css("visibility","hidden");
	slideoutMenu.animate({
    	left: screenSize
	}, 200);
}

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

function getDrawings(inUrl, callback){

		var url = inUrl+"/team/getDrawings";
		
		
		$.ajax({
			url: url,
//			data: jsonData,
			type:"POST",
			headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json; charset=utf-8' 
		    },
		    
			success:function(message){
				console.log("Success: "+message);
				callback(message);
			},
		    failure:function(message){
		    	console.log("Failure: "+message);
		    }
		});
}



function getUsersList(inUrl, callback){

	var url = inUrl+"/team/getUsersList";
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

function getBaseLayersFromService(inUrl, callback){

	var url = inUrl+"/team/getBaseLayers";
//	url = "/spr-mvc-hib/team/getBaseLayers";
	
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


function createNewGroup(inUrl, groupName, selectedUsers, callback){
	
	var url = inUrl+"/team/createNewGroup";

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


function getUserGroupsAndShareDrawings(inUrl, callback){

	var url = inUrl+"/team/getUserGroupsAndShareDrawings";
	
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

function submitSharingRequest(inUrl, shareDrawingId, shareWithGroups, shareWithMembers, callback){
	
	var url = inUrl+"/team/shareDrawing";
	
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


function getSharedDrawings(inUrl,sharedIdsUnique,callback){
	
	console.log(sharedIdsUnique);
	var url = inUrl+"/team/getDrawingsList";
	
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