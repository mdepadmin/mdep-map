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


<%-- 	<link rel="stylesheet" type="text/css" href="<spring:url value="/resources/jQuery/jquery-ui.min.css"/>"/> 
	<script type="text/javascript" src="<spring:url value="/resources/jQuery/jquery-ui.min.js"/>"></script> --%>
	
	<script src="<spring:url value="/resources/libs/leaflet-src.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/libs/leaflet.css"/>"/>

	<script src="<spring:url value="/resources/src/Leaflet.draw.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resources/dist/leaflet.draw.css"/>" />
	
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



	
	<script type="text/javascript">
		var geoData, loadedDrawings, cir;
		var drawingId=0, curSelection = 0;
		var updatedDraw;
		var userId;
		var idIW;
		var popUpLayer;
		var editedLayers;
		
		$(document).ready(function() {
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
		    	toggleMenuSlide();
		    });
			$('#logoutButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				logoutUser(url,logoutCallback);
			});
			
			
			$('#saveDrawingsButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				if(drawingId==0)
					saveDrawings(url, map, drawnItems);
				else
					updateDrawings(url, map, drawingId, drawnItems, updateCallback);
			});
			
			$('#getDrawingsButtonId').click(function(event){
				var url = "${pageContext.request.contextPath}";
				 getDrawings(url,getDrawingsCallback);
				
			});
			
			$('#clearDrawingsButtonId').click(function(event){
/* 				var drawnLayers = drawnItems.getLayers();
				drawnLayers.forEach(function(layer){
					map.removeLayer(layer);
				}); */
				
/* 				var lay = [];
				var i=0;
				map.eachLayer(function (layer) {
//				    console.log(layer);
				    lay.push(layer);
				    if(i>0)
				    	map.removeLayer(layer);
				    i++;
				});		*/
				
				
				
				clearDrawings();
				
			});
			
		});
		
		function clearDrawings(){
			drawingId = 0;
			var len = drawnItems.getLayers().length;
			for(var i=0; i< len; i++){
				var layer = drawnItems.getLayers()[0]; 
				drawnItems.removeLayer(layer);
			}
		}
		function loginCallback(){
			$('#loginButtonId').css("visibility","hidden");
			$('#logoutButtonId').css("visibility","visible");
			$('#message').text("Hello "+userId+"..!");
			console.log("${userId}");
			closeSlide();
		}
		
		function logoutCallback(){
			$('#logoutButtonId').css("visibility","hidden");
			$('#loginButtonId').css("visibility","visible");
			$('#message').text("Please login");
		}
		function updateCallback(updatedDrawing){
			msg = updatedDrawing;
			loadedDrawings[curSelection] = updatedDrawing;
		}
		function getDrawingsCallback(drawings){
			loadedDrawings = drawings;
			
			if(loadedDrawings.length>1)
			{
				var sel = document.createElement("select");
				sel.id='dropDown';
				
				for(var i=0; i<drawings.length;i++){
					var op = new Option();
					op.value = i;
					op.text = "Drawing-"+i;
					sel.options.add(op);  
				}
				$('#userDrawingsListDiv').html(sel);
			}
			
			if(loadedDrawings.length>0){
				var shapes= loadedDrawings[0];
				showDrawings(shapes);
			}
		}
		
		$(document).on('change','#dropDown',function(){
			console.log('option changed');
			var optionSelected = $("option:selected", this);
			
		    //console.log(optionSelected.text()+"*******"+optionSelected.val());
		    curSelection = optionSelected.val();
		    var shapes = loadedDrawings[curSelection];
		    showDrawings(shapes);
		});
		
		function getColor(type){
			switch(type){
			case 'polygon': return 'purple';
			case 'polyline': return 'red';
			case 'rectangle': return 'green';
			case 'circle': return 'steelblue';
			default: return 'black';
			}
		}
		
		function showDrawings(shapes){
			
			clearDrawings();
			
			geoData = JSON.parse(shapes.jsonData);
			drawingId = shapes.drawingId;
		
			var zoom = shapes.zoomLevel;
			var cen = shapes.jsonCenter;

			if(typeof(cen)!="undefined")
				if(cen!=null)
					map.panTo(JSON.parse(cen));
			
			if(typeof(zoom)!="undefined")
				if(zoom!=null)
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
			
			var savedLayers = L.geoJson(geoData);
			
			savedLayers.eachLayer(function(lay){
			
				var props = lay.feature.props;
				
				var type = props.type;
				
				//lay.options.color = getColor(type);

				lay.options.color = props.color;
				lay.options.opacity = props.opacity;
				
				console.log(type);
				
				
				if(type=='circle'){
					
//					console.log(lay.feature.props.radius);
//					cir = L.circle([lay.feature.geometry.coordinates[0], lay.feature.geometry.coordinates[1]], lay.feature.props.radius);
//					console.log(cir.toGeoJSON());
					
/*					var circLayer =L.geoJson(lay.feature, {
					    pointToLayer: function (feature, latlng) {
					    	var circ = L.circle(latlng, lay.feature.props.radius);
					    	circ.editing.enable();
					    	var cirGeo = L.geoJson(cir);
					    	console.log("circle here: "+cirGeo);
					        return circ; 
					    }
					});
					circLayer.addTo(map);*/
//					drawnItems.addLayer(circLayer);
				}
				else
					drawnItems.addLayer(lay);
			});
		}
	</script>
</head>

<body>
<input type="button" id="test" value="layers"/>
<input type="button" id="loginButtonId" class="button slideout-menu-toggle" style="visibility:visible" value="Login"/>
<input type="button" id="logoutButtonId" class="button" style="visibility:hidden" value="Logout"/>
<input type="button" id="saveDrawingsButtonId" class="button" value="Save Drawings"/>
<input type="button" id="getDrawingsButtonId" class="button" value="Get Drawings"/>
<input type="button" id="clearDrawingsButtonId" class="button" value="Clear Drawings"/>
<br/>
<div id="userDrawingsListDiv"></div>
<p id="message">Please login</p>
<div class="slideout-menu">
	<h3>Login <a href="#" class="slideout-menu-toggle">×</a></h3>
		<table>		<tbody>
			<tr>
				<td>User Id:</td>
				<td><input type="text" id="userId" value="a" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" id="password" value="a" /></td>
			</tr>
			<tr>
				<td><input type="button" id="buttonLogin" value="Login" /></td>
				<td></td>
			</tr>
		</tbody>
		</table>

</div>

<%-- 	<p>	${message}<br/>
	<a href="${pageContext.request.contextPath}/team/add.html">Add new team</a><br/>
	<a href="${pageContext.request.contextPath}/team/list.html">Team list</a><br/>
	</p>
 --%>

	<div id="map"></div>
	
	<script type="text/javascript">

		var map = L.map('map', {editable: true}).setView([39.505, -77.09], 6);
		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
			    attribution: 'Title Here',
			    maxZoom: 18,
			    id: 'sudheerpitchika.ciep2uaqn0ituskkmmyu1j6ps',
			    accessToken: 'pk.eyJ1Ijoic3VkaGVlcnBpdGNoaWthIiwiYSI6ImNpZXAydWJlcTBpeWNzMm0ycW10OTVpbmEifQ.z2zCTc_8_5R9JBxM1eFpmg'
				}).addTo(map);
		
		// L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png?{foo}', {foo: 'bar'}).addTo(map);
		
 		var	drawnItems = L.featureGroup().addTo(map);
 		drawnItems.on('click', function(e) { layerClicked(e.layer); });
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
			     
				 if(props.type=="marker"){
					 layer.bindPopup(sName);
					 layer.openPopup();
				 }
			     
			     if (idIW) {
			        map.closePopup();
			     }
			     
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
		  
			  
		  map.on('draw:edited', function(event) {
			  editedLayers = event.layers;
			  editedLayers.eachLayer(function(layer){
				  setAreaOrDistance(layer);
			  });
		  });
		  
		  
		 map.on('draw:created', function(event) {
		     
			 var  type = event.layerType, layer = event.layer;
			 //var geoJSON = layer.toGeoJSON();

			 layer.props = [];
			 layer.props.type = type;
			 //layer.props.color = getColor(type);
			 layer.props.opacity = 0.7;
			 popUpLayer = layer;

			 
			 idIW = L.popup();
		     var content = '<span><b>Shape Name</b></span><br/><input id="shapeName" type="text"/><br/><br/><span><b>Shape Description<b/></span><br/><textarea id="shapeDesc" cols="25" rows="3"></textarea><br/><br/><span><b>Shape Date<b/></span><br/><input type="text" id="shapeDate"/><br/><br/> <span><b><div id="sizeMeasure"> </div> <div id="sizeValue"> </div> <b/></span> <br/><br/><input type="button" id="okBtn" value="Save" onclick="saveIdIW()"/>';
		     idIW.setContent(content);
		     idIW.setLatLng(getpopUpCenter()); //calculated based on the e.layertype
		     idIW.openOn(map);
		     
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
					 $( '#sizeMeasure').text('Distance: ');
					 $( '#sizeValue').text(measure);
				 }
			 }
			 
			$(function() {
			    $( "#shapeDate" ).datepicker();
			});
				
			 console.log(layer);
			 drawnItems.addLayer(layer);

		});  
		
		function layerClicked(layer){
			
			popUpLayer = layer;

			var fea = layer.feature;
			var props;

			if(typeof(fea)!="undefined")
				props = fea.props;
			else
				props= layer.props;
			
			var type = props.type;
			
			 idIW = L.popup();
		     var content = '<span><b>Shape Name</b></span><br/><input id="shapeName" type="text"/><br/><br/><span><b>Shape Description<b/></span><br/><textarea id="shapeDesc" cols="25" rows="5"></textarea><br/><br/><span><b>Shape Date<b/></span><br/><input type="text" id="shapeDate"/><br/><br/> <span><b><div id="sizeMeasure"> </div> <div id="sizeValue"> </div> <b/></span><br/><br/><input type="button" id="okBtn" value="Save" onclick="saveIdIW()"/>';
		     idIW.setContent(content);
		     idIW.setLatLng(getpopUpCenter()); //calculated based on the e.layertype
		     idIW.openOn(map);
		     
		     
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
				 
			$(function() {
			    $( "#shapeDate" ).datepicker();
			});
			
			
		     $('#shapeName').val(props.title);
		     $('#shapeDesc').val(props.desc);
		     $('#shapeDate').val(props.date);
		     
		}
		
		$(document).ready(function() {
			$('#test').click(function(event){				
				for(var i = 0; i< drawnItems.getLayers().length; i++){
					var h = drawnItems.getLayers()[i];
					var j = h.toGeoJSON();
					 }
				
				var bounds = [[39.505, -77.09], [38.505, -71.09]];
				var rect = L.rectangle(bounds, {color: "#ff7800", weight: 4});
				rect.editing.enable();
				rect.addTo(map);
				drawnItems.addLayer(rect);
//				map.addLayer(rect);
			});
			
			
		});
	</script>

</body>
</html>