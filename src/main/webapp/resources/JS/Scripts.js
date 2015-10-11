/**
 * 
 */


function showForm(){
	$('#loginForm').toggle(1000);
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
	    
		success:function(message){
			console.log(message);
			
			if(message == true)
				$('#message').text("Yayy. :)");
				
			else if(message == false)
				$('#message').text("Pchh. :(");
			
			callback();
		},
	    failure:function(message){
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


function saveDrawings(inUrl, map, drawnItems){
	
	var len = drawnItems.getLayers().length;
	var geo = drawnItems.toGeoJSON();
	
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);
	
	for(var i=0; i<len;i++){
		var curLayer = drawnItems.getLayers()[i];
		var props = curLayer.props;
		var options = curLayer.options;
		
		var layerGeo = curLayer.toGeoJSON();
		layerGeo.props = {};
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
	
	var url = inUrl+"/team/saveDrawings";

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
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}


function updateDrawings(inUrl, map, drawingId, drawnItems, callback){
	
	var len = drawnItems.getLayers().length;
	var geo = drawnItems.toGeoJSON();
	
	var featuresLen = geo.features.length;
	geo.features.splice(0,featuresLen);
	
	for(var i=0; i<len;i++){
		var curLayer = drawnItems.getLayers()[i];
		var type;
		var title, desc;
		var props;
		var options = curLayer.options;
		console.log(curLayer);
		
		//has feature - old shape
		var fea = curLayer.feature;
		
		if(typeof(fea)!="undefined")
			props = fea.props;
		else
			props= curLayer.props;
			
		type = props.type;
		title = props.title;
		desc = props.desc;
		
		
		var layerGeo = curLayer.toGeoJSON();
		layerGeo.props = {};
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
			callback(message);
		},
	    failure:function(message){
	    	console.log("Failure: "+message);
	    }
	});
}

function toggleMenuSlide(){
	// create menu variables
	var slideoutMenu = $('.slideout-menu');	
	var screenSize = $(window).width();
	var leftPx = screenSize+"px";
	
	$('.slideout-menu').css("left",leftPx);
	
	// slide menu
	if (slideoutMenu.hasClass("open")) {
		openSlide();
	} else {
		closeSlide();
	}
}

function closeSlide(){
	var slideoutMenu = $('.slideout-menu');
	var screenSize = $(window).width();
	slideoutMenu.toggleClass("open");
	
	$('.slideout-menu').css("visibility","hidden");
	slideoutMenu.animate({
    	left: screenSize
	}, 200);
}

function openSlide(){
	var slideoutMenu = $('.slideout-menu');
	var slideoutMenuWidth = $('.slideout-menu').width();
	
	var screenSize = $(window).width();	
	var leftStart = screenSize - slideoutMenuWidth;
	leftStart = leftStart + "px";
	
	slideoutMenu.toggleClass("open");
	$('.slideout-menu').css("visibility","visible");
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
