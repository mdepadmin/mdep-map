<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Home page</title>

<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
	
	<script type="text/javascript" src="<spring:url value="/resources/JS/jquery-1.11.3.min.js"/>"></script>	
	<script src="http://cdn.leafletjs.com/leaflet-0.7.5/leaflet.js"></script>
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.5/leaflet.css" />
	
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

	
	<script type="text/javascript">
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
		var shareWithGroups = [];
		var shareWithMembers = [];
		
		var tempvalue;
		var chk;
		var hehe;
		
		$(document).ready(function() {
			
			$('#searchButton').click(function(event){
				var searchText = $('#searchBox').val();
				if(searchText.length > 0){
					var searchTextEncoded = encodeURIComponent(searchText);
					var query = 'http://voyager1.mojavedata.gov:8080/solr/v0/select?q='+searchTextEncoded+'&wt=json&rows=50';
					console.log(query);
					getSearchResults(query, getResultsCallback);
				}
			});
			
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

 			$('#buttonLogin').click(function(event){
				var url = "${pageContext.request.contextPath}";
				userId = $('#userId').val();
				checkCredentials(url,loginCallback);
			});
 			
 			
			$('.slideout-menu-toggle').on('click', function(event){
		    	event.preventDefault();
		    	var menuSlide = $('.slideout-menu');
		    	toggleSlide(menuSlide);
		    });
			
			$('.slideout-search-toggle').on('click', function(event){
				event.preventDefault();
		    	var searchSlide = $('.slideout-search');
		    	toggleSlide(searchSlide);
		    });
			
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
			
			$('.slideout-share-toggle').on('click', function(event){
				event.preventDefault();
				shareSlideOpen = !shareSlideOpen;
				if(shareSlideOpen){
					addDrawingsAndGroupsListToDropdown();
				}
		    	var shareSlide = $('.slideout-share');
		    	toggleSlide(shareSlide);		    	
		    });
			
			function addDrawingsAndGroupsListToDropdown(){
	
				$('#drawingShareDropdown').empty();
				var sel = document.getElementById('drawingShareDropdown');
				for(var i=0; i<loadedDrawings.length;i++){
					var op = new Option();
					op.value = i;
					op.text = "Drawing-"+i;
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
			
			$('#submitSharingButton').click(function(event){
				
				shareWithMembers = [];
				shareWithGroups = [];
				
				var dropSelectedNum = parseInt($('#drawingShareDropdown').val());
				var shareDrawingId = loadedDrawings[dropSelectedNum].drawingId;
				
				var groupNamesList = $('input')
			    .filter(function() {
			        return this.id.match('groupList-*');
			    });
				
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
				
				var shareWithMembersUnique = [];
				$.each(shareWithMembers, function(i, el){
				    if($.inArray(el, shareWithMembersUnique) === -1) shareWithMembersUnique.push(el);
				});
				
				var url = "${pageContext.request.contextPath}";
				submitSharingRequest(url, shareDrawingId, shareWithGroups, shareWithMembersUnique, submitSharingRequestCallback);
				
			});

			function submitSharingRequestCallback(msg){
				
			}
			
			$('#logoutButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				logoutUser(url,logoutCallback);
			});
			
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
					 var url = "${pageContext.request.contextPath}";
					 createNewGroup(url, groupName, selectedUsers, createNewGroupCallback);
				 }
			 });
			
			 function createNewGroupCallback(message){
				 var groupSlide = $('.slideout-creategroup');
		    	 toggleSlide(groupSlide);
			 }
			 
			$('#saveDrawingsButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				if(drawingId==0)
					saveDrawings(url, map, drawnItems, saveDrawingsCallback);
				else
					updateDrawings(url, map, drawingId, drawnItems, updateCallback);
			});
			
 			$('#getDrawingsButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				 getDrawings(url,getDrawingsCallback);
				
			}); 
			
			$('#test').click(function(event){
				var url = "${pageContext.request.contextPath}";
				getUserGroupsAndShareDrawings(url,getUserGroupsAndShareDrawingsCallback);
			});

			function getUserGroupsAndShareDrawingsCallback(msg){
				
			}
			
			
			$('#test1').click(function(event){
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
				
				getSharedDrawings(url,sharedIdsUnique,getSharedDrawingsCallback);
				
			});
			
			function getSharedDrawingsCallback(drawings){
				sharedDrawings = drawings;

				if (sharedDrawings.length > 1) {
					var sel = document.createElement("select");
					sel.id = 'sharedDrawingsDropDown';

					for (var i = 0; i < sharedDrawings.length; i++) {
						var op = new Option();
						op.value = i;
						op.text = "Shared Drawing-" + i;
						sel.options.add(op);
					}
					$('#sharedDrawingsListDiv').html(sel);
				}

				/* if (loadedDrawings.length > 0) {
					var shapes = loadedDrawings[0];
					showDrawings(true, shapes);
				} */
			}
			
			$(document).on('change', '#sharedDrawingsDropDown', function() {
				console.log('shared option changed');
				var optionSelected = $("option:selected", this);

				curSelection = parseInt(optionSelected.val());
				var shapes = sharedDrawings[curSelection];
				console.log("Option changed: "+shapes);
				showDrawings(true, shapes);
			});
			
			$('#clearDrawingsButtonId').click(function(event){
				clearDrawings();
			});
			
			$('#newDrawingButtonId').click(function(event){

				clearDrawings();
				
				if(loadedDrawings.length>1)
				{
					var sel = document.createElement("select");
					sel.id='dropDownMultiSelect';
					sel.multiple="multiple";
					sel.size = "3";
					
					for(var i=0; i<loadedDrawings.length;i++){
						var op = new Option();
						op.value = i;
						op.text = "Drawing-"+i;
						sel.options.add(op);  
					}
					$('#includeDrawingsListDiv').html(sel);
					addNewButton("button","Add", sel);
				}
			});
			
		});

	
		
		function getUsersListCallback(userList){
	 		$("#userListDiv").empty();
			if(userList.length > 0){
				var count = userList.length;
				for(var i = 0; i < count; i++){
					var user = userList[i];
					
					var $ctrl = $('<label />').html(user.userId)
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
		
		function getBaseLayersCallback(returnBaseLayers){
			var layers = {};
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
					hehe = layer;
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
				layers[baseLayer.displayName] = layerGroup;
			}
			var controls = L.control.layers(layers);		
			controls.addTo(map);
		}
		
		function addNewButton(type,name, sel){
			    var element = document.createElement("input"); 
			    element.type = type;
			    element.value = name; 
			    element.name = name;
			    
			    var parent = document.getElementById("includeDrawingsListDiv"); //replace with jquery
			    parent.appendChild(element);
			    
			    element.onclick = function() {
			        buttonClickCallback(sel, includeDrawings);
			    };
		}
		
		function buttonClickCallback(sel, callback){
			var opts = [], opt;
			
		    for (var i=0, len=sel.options.length; i<len; i++) {
		        opt = sel.options[i];
		        if ( opt.selected ) {
		        	tempvalue = opt;    	
		            var curSelection = opt.value;
				    var shapes = loadedDrawings[curSelection];
				    opts.push(shapes);
		        }
		    }
		    
		    if (callback) {
		    	callback(opts);
            }
		}
		
		function includeDrawings(inclDraws){
			for(var i=0; i<inclDraws.length; i++)
				showDrawings(false, inclDraws[i]);
			drawingId = 0;
		}
		
		function clearDrawings(){
			drawingId = 0;
			var len = drawnItems.getLayers().length;
			for(var i=0; i< len; i++){
				var layer = drawnItems.getLayers()[0]; 
				drawnItems.removeLayer(layer);
			}
		}
		
		function loginCallback(user){
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
		
		function logoutCallback(){
			$('#logoutButtonId').css("visibility","hidden");
			$('#loginButtonId').css("visibility","visible");
			$('#message').text("Please login");
			$('#createGroupButtonId').css("visibility","hidden");
		}
		
		function saveDrawingsCallback(returnDrawingId){
			
		}

		function updateCallback(updatedDrawing) {
			loadedDrawings[curSelection] = updatedDrawing;
			clearDrawings();
			showDrawings(true, updatedDrawing);
			
		}
		
		function getDrawingsCallback(drawings) {
			loadedDrawings = drawings;

			if (loadedDrawings.length > 0) {
				var sel = document.createElement("select");
				sel.id = 'dropDown';

				for (var i = 0; i < drawings.length; i++) {
					var op = new Option();
					op.value = i;
					op.text = "Drawing-" + i;
					sel.options.add(op);
				}
				$('#userDrawingsListDiv').html(sel);
			}

			if (loadedDrawings.length > 0) {
				var shapes = loadedDrawings[0];
				showDrawings(true, shapes);
			}
		}

		
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

		function showDrawings(clear, shapes) {

			if (clear)
				clearDrawings();

			geoData = JSON.parse(shapes.jsonData);
			drawingId = shapes.drawingId;

			var zoom = shapes.zoomLevel;
			var cen = shapes.jsonCenter;

			if (typeof (cen) != "undefined")
				if (cen != null)
					map.panTo(JSON.parse(cen));

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
			
			if(geoData.hasOwnProperty('includeDrawings'))
			{
				var checkboxDiv = $('#dispDrawingsCheckBoxDiv');
				var includeIds = geoData.includeDrawings;
				for(var j=0; j<includeIds.length; j++){
					var includedId = includeIds[j];

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
											//ddddd
									}
									drawnItems.addLayer(lay);
								});
								 var $ctrl = $('<label />').html('Drawing '+i)
		                          .prepend($('<input/>').attr({ type: 'checkbox', name: includedId, value: includedId, id: 'drawing'+i, checked:true}));
								 checkboxDiv.append($ctrl);
							}
						}
					}
				}
				if(includeIds.length == 0){
					$('#dispDrawingsCheckBoxDiv').empty();
				}
			}
		}
		
		$(document).on('change', '[type=checkbox]', function() {
			chk = $(this);
			var id = chk.attr('id');
			var drawId = parseInt(chk.attr('value'));
			if (id.match("^drawing")){
				if(chk.is(":checked")){
					addIncludeDrawing(drawId);
				}else{
					removeIncludeDrawing(drawId);
				}
			}
			else if (id.match("^result")){
				if(chk.is(":checked")){
					console.log('result checked');
					//
				}else{
					console.log('result unchecked');
					//
				}
			}
 			else if (id.match("^groupList-")){
				if(chk.is(":checked")){
					checkedGroup(id);
				}else{
					unCheckedGroup(id);
				}
			}
 			else if (id.match("^groupMember-")){
				if(chk.is(":checked")){
					
				}else{
					unCheckedGroupMember(id);
				}
			}
		});

		function checkedGroup(id){
			var splits = id.split("-");
			var groupNum = parseInt(splits[1]);
			var filtered = $('input')
		    .filter(function() {
		        return this.id.match('groupMember-'+groupNum+'-*');
		    });
			
			$.each( filtered, function( index, memberBox ){
				memberBox.checked = true;
			});
		}
		
		function unCheckedGroup(id){
			var splits = id.split("-");
			var groupNum = parseInt(splits[1]);
			var filtered = $('input')
		    .filter(function() {
		        return this.id.match('groupMember-'+groupNum+'-*');
		    });
			$.each( filtered, function( index, memberBox ){
				memberBox.checked = false;
			});
		}
		
		function unCheckedGroupMember(id){
			var groupOrderNum = parseInt(id.split('-')[1]);
			$('#groupList-'+groupOrderNum).attr('checked', false);
		}
		
		function addIncludeDrawing(includedId){
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
						drawnItems.addLayer(lay);
					});
					break;
				}
			}
		}
		
		function removeIncludeDrawing(drawId){
			drawnItems.eachLayer(function(layer){
				if(layer.feature.props.drawingId == drawId)
					drawnItems.removeLayer(layer);
			});
		}
		
		


	</script>
    
    <script type="text/javascript">
    var files = [], result;
    $(document)
            .on(
                    "change",
                    "#fileLoader",
                    function(event) {
                     files=event.target.files;
                    });

    $(document)
            .on(
                    "click",
                    "#fileSubmit",
                    function() {
                    processUpload();
                    });

    function processUpload()
              {
		    	var url = "${pageContext.request.contextPath}";
                  var oMyForm = new FormData();
                  oMyForm.append("file", files[0]);
                 $
                    .ajax({dataType : 'text',
//                        url : "/spr-mvc-hib/team/savefiles.html",
                        url : url+"/team/savefiles.html",
                        data : oMyForm,
                        type : "POST",
                        enctype: 'multipart/form-data',
                        processData: false, 
                        contentType:false,
                        success : function(msg) {
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
            				
                            props.image = result;
                            
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

<body>
<input type="button" id="searchButtonId" class="button slideout-search-toggle" style="visibility:visible" value="Search"/>
<input type="button" id="test" value="layers"/> <input type="button" id="test1" value="layers-1"/>
<input type="button" id="loginButtonId" class="button slideout-menu-toggle" style="visibility:visible" value="Login"/>
<input type="button" id="logoutButtonId" class="button" style="visibility:hidden" value="Logout"/>
<input type="button" id="saveDrawingsButtonId" class="button" value="Save Drawings"/>
<input type="button" id="getDrawingsButtonId" class="button" value="Get Drawings"/>
<input type="button" id="clearDrawingsButtonId" class="button" value="Clear Drawings"/>
<input type="button" id="newDrawingButtonId" class="button" value="New Drawing"/>
<input type="button" id="createGroupButtonId" class="button slideout-creategroup-toggle" value="Create Group" style="visibility:hidden"/>
<input type="button" id="shareButtonId" class="button slideout-share-toggle" style="visibility:visible" value="Share"/>
<input type="button" id="shareFeedButtonId" class="button slideout-shareFeed-toggle" style="visibility:visible" value="Share Feed"/>
<div id="includeDrawingsListDiv"></div>
<div id="dispDrawingsCheckBoxDiv"></div>
<div id="userDrawingsListDiv"></div>
<div id="sharedDrawingsListDiv"></div>

<p id="message">Please login</p>

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


<div class="slideout-search open">
	<h3>Search <a href="#" class="slideout-search-toggle">×</a></h3>
	<input type="text" id="searchBox" value="new york"/>
	<input type="button" id="searchButton" class="button" value="Search"/>
	
	<div id="searchResultsDiv" class="searchResults">
		Search Results<br/>
	</div>
	
</div>


<div class="slideout-creategroup open">
	<h3>Search <a href="#" class="slideout-creategroup-toggle">×</a></h3>
	<input type="text" id="groupNameTextBox" value=""/>
	<input type="button" id="createNewGroupButtonId" class="button" value="Create"/>
	
	<div id="userListDiv" class="searchResults">
		Users<br/>
	</div>	
</div>

<div class="slideout-share open">
	<h3>Share <a href="#" class="slideout-share-toggle">×</a></h3>
	<input type="button" id="submitSharingButton" class="button" value="Share"/>
	<br/><br/>
	<select id ="drawingShareDropdown">
	</select>
	<br/><br/>
	<div id="userGroupsDiv" class="searchResults">
		Groups <br/>
	</div>
</div>


<%-- 	<p>	${message}<br/>
	<a href="${pageContext.request.contextPath}/team/add.html">Add new team</a><br/>
	<a href="${pageContext.request.contextPath}/team/list.html">Team list</a><br/>
	</p>
 --%>

	<div id="map"></div>
	<script src="<spring:url value="/resources/JS/lightbox.js"/>"></script>
	<script>
    lightbox.option({
      'resizeDuration': 400,
      'wrapAround': true
    });
	</script>
	<script type="text/javascript">
	
		var map = L.map('map', {editable: true}).setView([39.505, -77.09], 6);
		
		var mapBoxLayer = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
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
		});


		
/* 		var HERE_normalDayTransitLayer = L.tileLayer('http://{s}.{base}.maps.cit.api.here.com/maptile/2.1/{type}/{mapID}/normal.day.transit/{z}/{x}/{y}/{size}/{format}?app_id={app_id}&app_code={app_code}&lg={language}', {
			attribution: 'Map &copy; 1987-2014 <a href="http://developer.here.com">HERE</a>',
			base: 'base',
			type: 'maptile'
		}); */
		
//		map.addLayer(g_satellite);
		map.addLayer(mapquestLayer);
		
		//g_roadmap.setOpacity(0.6);
		//g_satellite.setOpacity(0.6);
		//g_terrain.setOpacity(0.6);
		
		
		var roadmap =L.layerGroup([g_roadmap]);
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
		var Esri_WorldGrayCanvas = L.layerGroup([Esri_WorldGrayCanvasLayer]);

/* 		var HERE_normalDayTransit = L.layerGroup([HERE_normalDayTransitLayer]); */
		
		var layers = {
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
			
/* 			"normalDayTransit" : HERE_normalDayTransit, */
		};

		//add layer control
/* 		var controls = L.control.layers(layers);		
		controls.addTo(map);
 */		

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
			    circle: {
			     shapeOptions: {
			      color: 'steelblue'
			     },
			    },
			   },
			   edit: {
			    featureGroup: drawnItems
			   }
			  });
			  map.addControl(drawControl);
			  
			  
		  
		  function saveIdIW() {
			     var sName = $('#shapeName').val();
			     var sDesc = $('#shapeDesc').val();
				 var sDate = $('#shapeDate').val();
				 
			     //var drawings = drawnItems.getLayers();  //drawnItems is a container for the drawn objects
			     //var layer = drawings[drawings.length - 1];
			     
			     var layer = popUpLayer;
			     
				var fea = layer.feature;
				var props;

				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= layer.props;
					
			     props.title = sName;
			     props.desc = sDesc;
				 props.date = sDate;
			     props.opacity = parseFloat($('#slidernumber').html());
			     layer.options.opacity = parseFloat($('#slidernumber').html());
			     layer.options.fillOpacity = parseFloat($('#slidernumber').html());
			     
				 if(props.type=="marker" && sName.length > 0){
					 layer.unbindLabel();
					 layer.bindLabel(sName);
					 layer.setLabelNoHide(true);
				 }
			     
			     if (idIW) {
			        map.closePopup();
			     }
			     
			     //remove layer, and add it back (with updated opacity)
			     drawnItems.removeLayer(layer);
			     drawnItems.addLayer(layer);
			     console.log(layer);
			     popUpLayer = null;
			}
		  
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
		  
		  function setAreaOrDistance(layer){
			  
			  
			  var fea = layer.feature;
				var props;

				if(typeof(fea)!="undefined")
					props = fea.props;
				else
					props= layer.props;
				
			 var type = props.type;
			 
			 if(type=="polygon" || type=="rectangle"){
				 	var area = L.GeometryUtil.geodesicArea(layer.getLatLngs());
				 	console.log("area "+area);
				 	props.measure = area;
				 }
				 else if (type === 'circle') {
				     var area = 0;
				     var radius = layer.getRadius();
				     area = (Math.PI) * (radius * radius);
				     props.measure = ((area / 1000000).toFixed(2) + ' km<sup>2</sup>');
				}
				 else if (type=="polyline"){					 
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
	     
	     
		  map.on('draw:edited', function(event) {
			  editedLayers = event.layers;
			  editedLayers.eachLayer(function(layer){
				  setAreaOrDistance(layer);
			  });
		  });

		  map.on('draw:editing', function() {
			  drawnItems.eachLayer(function(layer){
					var fea = layer.feature;
					var props;
					
					if(typeof(fea)!="undefined")
						props = fea.props;
					else
						props= layer.props;
					
					if(drawingId != props.drawingId){
						layer.editing.disable();
					}				
				});
		  });
		  
		  
		 map.on('draw:created', function(event) {
		     
			 var  type = event.layerType, layer = event.layer;
			 //var geoJSON = layer.toGeoJSON();

			 layer.props = {};
			 layer.props.type = type;
			 layer.props.drawingId = drawingId;
			 
			 //layer.props.color = getColor(type);
			 layer.props.opacity = 0.7;
			 popUpLayer = layer;

			 
			 idIW = L.popup();
		     var content = getPopupMarkup(); 
		     				
		     idIW.setContent(content);
		     idIW.setLatLng(getpopUpCenter()); //calculated based on the e.layertype
		     idIW.openOn(map);

		     $('#opacitySlider').on("change mousemove", function() {
		    	    $('#slidernumber').html($(this).val());
		    });
		     
		     $("input[type=range]").val(0.7);
		     $("#slidernumber").text("0.7");
		     
			 if (type === "circle") {
			        var radius = layer.getRadius();
			        layer.props.radius = radius;
			 }
			 
			 setAreaOrDistance(layer);
			 
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

			 
			$(function() {
			    $( "#shapeDate" ).datepicker();
			});
				
			 console.log(layer);
			 drawnItems.addLayer(layer);

		});  
		
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