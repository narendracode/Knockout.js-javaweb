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
<p><button data-bind='click: saveUserData'>Save Data</button></p>
</form>

<script type='text/javascript' src='assets/js/knockout.js'></script>
<script type='text/javascript' src='assets/js/jQuery.js'></script>
<script type='text/javascript' src='assets/js/json.js'></script>
<script type="text/javascript" src="assets/js/knockout.mapping.js"></script>
<script type='text/javascript'>
function PersonViewModel(){
	var self = this;
	self.firstName=ko.observable("");
	self.lastName=ko.observable("");
	self.activities=ko.observableArray("");
	self.favoriteHobby=ko.observable("");
	
	self.loadUserData= function(){
		 $.getJSON("http://localhost:8080/KnockOutAjaxDemo/LoadDataServlet",function(data){
			// var viewModel = ko.mapping.fromJS(data);
				//ko.applyBindings(viewModel);
				self.firstName(data.firstName);
				self.lastName(data.lastName);
				self.activities(data.activities);
				self.favoriteHobby(data.favoriteHobby);
			 });
		}//loadUserData

	self.saveUserData= function(){
		var data_to_send = {userData:ko.toJSON(self)};
		$.post("http://localhost:8080/KnockOutAjaxDemo/SaveDataServlet?method=save", data_to_send, function(data) { 
			alert("returned data:"+data);
		});
		}//saveData
}

ko.applyBindings(new PersonViewModel());
/* $.getJSON("http://localhost:8080/KnockOutAjaxDemo/LoadDataServlet",function(data){
	// alert("Name:"+data.firstName+" "+data.lastName);
	//self.firstName(data.firstName);
	//self.lastName(data.lastName);
	//self.activities(data.activities);
	//self.favoriteHobby(data.favoriteHobby);
		var viewModel = ko.mapping.fromJS(data);
		ko.applyBindings(viewModel);
	 });
*/
/*$.ajax({
	 type: "POST",
     url: "http://localhost:8080/KnockOutAjaxDemo/LoadDataServlet",
     data: "{}",
     contentType: "application/json; charset=utf-8",
     dataType: "json",
     async: true,
     cache: false,
     success: function (msg) {
     alert("Error");
         },
     error: function (x, e) {
         alert("error occured" + x.responseText);
     }
});

	*/	
 
</script>
</body>
</html>