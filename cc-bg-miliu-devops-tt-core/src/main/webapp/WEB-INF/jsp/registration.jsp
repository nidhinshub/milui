<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">

<head>
<%@ page contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>AWS DevOps Training</title>
<link rel="stylesheet" type="text/css" th:href="@{/css/login.css}" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body {
	height: 100%;
	background-color: #e6e6e6;
}

.main_container {
	padding: 50px 0;
	/*background: linear-gradient(to top right, #3399ff 0%, #ff33cc 100%); */
	background: #e6e6e6;
	padding: 3%;
}

.text_input {
	padding: 16px !important;
	height: 40px !important;
	border: 1px solid #e0dede !important;
	margin-bottom: 10px;
}

.login_btn {
	border-radius: 3px;
	background: #5aa75a !important;
	border: 1px solid #5aa75a !important;
	padding-bottom: 10px;
	outline: none;
	width: 100% !important;
	color: white !important;
}

.reg_btn {
	float: right;
	width: 30% !important;
	margin-top: 40px !important;
	color: white;
}

.bg_contanier {
	background: white;
	border: 1px solid #d4d4d4;
	max-width: 400px;
	padding: 2% 3% 2%;
	margin: 0 auto;
	border-radius: 10px;
}

.btn-block {
	display: block;
	width: 21%;
	margin-top: 20px;
	float: right;
	background: none;
	text-decoration: underline;
	color: blue;
}
</style>
<script>
	function validateForm() {
		var error = "Email or Password invalid, please verify";
		var name = document.login.name.value;
		var lastName = document.login.lastName.value;
		var email = document.login.email.value;
		var password = document.login.password.value;
		var letters = /^[A-Za-z]+$/;
		var passMatch = /^([a-zA-Z0-9 @#$%^&*!]+)$/;
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		if (name == null || name == "" || !(name.match(letters))) {

			document.getElementById("passwordLabel").style.visibility = "visible";
			document.getElementById("passwordLabel").innerHTML = "First Name invalid, please verify";
			return false;
		} else if (lastName == null || lastName == ""
				|| !(lastName.match(letters))) {
			document.getElementById("passwordLabel").style.visibility = "visible";
			document.getElementById("passwordLabel").innerHTML = "Last Name invalid, please verify";
			return false;
		} else if (email == null || email == "" || !(email.match(re))) {
			document.getElementById("passwordLabel").style.visibility = "visible";
			document.getElementById("passwordLabel").innerHTML = "email invalid, please verify";
			return false;
		} else if (password == null || password == "" || password.length < 6
				|| !(password.match(passMatch))) {
			document.getElementById("passwordLabel").innerHTML = "password invalid, please verify";
			return false;
		} else {
			document.getElementById("passwordLabel").style.visibility = "hidden";

		}
	}
	/* 
	 function validateName() {
	 var name = document.login.name.value;
	 if (name == null || name == "" || !(name.match(letters))) {
	 document.getElementById("firstNameLabel").style.visibility = "visible";
	 return false;
	 }else{
	 document.getElementById("firstNameLabel").style.visibility = "hidden";
	 }
	 } */
</script>
<body>

	<div class="container main_container">
		<!--    <img th:src="@{/images/login.jpg}" class="img-responsive center-block" width="300" height="300" alt="Logo"/> -->
		<div class="bg_contanier" style="height: 127%;">
			<img src="./images/miliu_logo.png"
				class="img-responsive center-block" width="300" height="300"
				alt="Logo" style="margin-top: -6%; width: 45%; margin-bottom: -10%;">
			<form name="login" th:action="@{/miliu/registration}" method="POST"
				class="form-signin" onsubmit="return validateForm()">
				<p
					style="text-align: center; color: #e2110d; font-size: 100%; font-weight: bold; margin-top: 5%; margin-bottom: -6%;">
					${fail}</p>
				<h3 class="form-signin-heading" th:text="Login"></h3>
				<br /> <input type="text" id="name" name="name"
					placeholder="First Name" class="form-control text_input" /> <br>
	
				<input type="text" placeholder="Last Name" id="lastName"
					name="lastName" class="form-control text_input" /> <br>
			
				<input type="text" id="email" name="email" placeholder="Email"
					class="form-control text_input" /> <br>
				
				<input type="password" placeholder="Password" id="password"
					name="password" class="form-control text_input" /> 
				<p id="passwordLabel"
					style="visibility: hidden; text-align: center; color: #e2110d; color: #e2110d; font-size: 93%; font-weight: bold;">Email
					or Password invalid, please verify</p>
				<%--       </c:if> --%>
				<button class="btn btn-lg btn-primary login_btn" name="Submit"
					value="Login" type="Submit">Register</button>
			</form>
			<form action="/miliu/login" method="GET">
				<button
					style="margin-top: 2%; float: right; background-color: white; color: blue; text-decoration: underline;"
					type="Submit" class="btn">Login</button>
			</form>
			<div style="margin-top: 15%; text-align: center;">
				<span> <b><i>miliu</i></b> AWS DevOps Training
				</span>
			</div>
		</div>
	</div>
</body>
</html>