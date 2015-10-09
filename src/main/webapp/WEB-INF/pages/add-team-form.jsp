<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add team page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- <script src="../src/WEB-INF/jquery-1.11.3.min.js" type="text/javascript"/> -->


<script type="text/javascript">
	$(document).ready(function() {
		
		$('#buttonSubmit').click(function(event){
			var name = $('#name').val();
			var rating = $('#rating').val();
			var json = {"name":name, "rating":rating};
			var jsonData = JSON.stringify(json);
			console.log(jsonData);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/team/add.json",
				data: jsonData,
				type:"POST",
				headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json; charset=utf-8' 
			    },
				
/* 				beforeSend:function(xhr){
					xhr.setRequestHeader("Accept","application/json");
					xhr.setRequestHeader("Content-Type","application/json");
				},
 */				
				success:function(message){
					console.log(message);
					$('#message').text("Added..!!");			
				}
			});
		});
	});
</script>
</head>

<body>
<h1>Add team page</h1>
<p>Here you can add a new team.</p>


<table>
<tbody>
	<tr>
		<td>Name:</td>
		<td><input type="text" id="name" value="C" /></td>
	</tr>
	<tr>
		<td>Rating:</td>
		<td><input type="text" id="rating" value="3" /></td>
	</tr>
	<tr>
		<td><input type="button" id="buttonSubmit" value="Add" /></td>
		<td></td>
	</tr>
</tbody>



</table>

<p id="message"></p>
<p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
</body>
</html>