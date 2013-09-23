<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
<link rel='stylesheet' href='assets/css/style.css'>
</head>
<body>
<h1> knockout, Ajax calling...</h1>
<form action='#' method='post'>
<p>First Name:<input data-bind='value: firstName'/></p>
<p>Last Name: <input data-bind='value: lastName' /></p>
<div>
  Your Favorite Food: <select data-bind='options: activities, value:favoriteHobby'></select>
</div>
<p><button data-bind='click: loadUserData'>Load Data</button></p>
</form>

<script type='text/javascript' src='assets/js/knockout.js'></script>
<script type='text/javascript' src='assets/js/jQuery.js'></script>
<script type='text/javascript' src='assets/js/json.js'></script>
<script type="text/javascript" src="assets/js/knockout.mapping.js"></script>
<script type='text/javascript'>

function PersonViewModel(){
this.firstName = ko.observable("");
this.lastName = ko.observable("");
this.favoriteHobby = ko.observable("");
	
}
var viewModel ;
$.getJSON("http://localhost:8080/KnockOutAjaxDemo/LoadDataServlet",function(data){
		viewModel = ko.mapping.fromJS(data);
		
	 });



viewModel.loadUserData(){
	alert("loadUserData is called");
	$.getJSON("http://localhost:8080/KnockOutAjaxDemo/LoadDataServlet",function(data){
		var viewModel1 = ko.mapping.fromJS(data);
		ko.applyBindings(viewModel1);
	 });
}
ko.applyBindings(viewModel);
</script>
</body>
</html>