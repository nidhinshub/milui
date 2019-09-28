<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
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
	background: #009fdc !important;
	border: 1px solid #00a4e2 !important;
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
		var email = document.login.email.value;
		var password = document.login.password.value;

		if (email == null || email == "") {
			document.getElementById("error").style.visibility = "visible";
			return false;
		} else if (password.length < 6) {
			document.getElementById("error").style.visibility = "visible";
			return false;
		}
	}
</script>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
		response.setDateHeader("Expires", 0); //prevents caching at the proxy server
	%>
	<div class="container main_container">

		<div class="bg_contanier">

			<img src="./images/miliu_logo.png"
				class="img-responsive center-block" width="300" height="300"
				alt="Logo" style="margin-top: -6%; width: 45%; margin-bottom: -10%;">
			<form name="login" th:action="@{/login}" method="POST"
				class="form-signin" onsubmit="return validateForm()">
				<p
					style="text-align: center; color: #e2110d; font-size: 100%; font-weight: bold; margin-top: 5%; margin-bottom: -6%;">
					${error}</p>
				<h3 class="form-signin-heading" th:text="Login"></h3>
				<br /> <input type="text" id="email" name="email"
					placeholder="Email" class="form-control text_input" /> <br /> <input
					type="password" placeholder="Password" id="password"
					name="password" class="form-control text_input" /> <br />

				<%--        <c:if test="${!(empty param.email)}"> --%>
				<p id="error"
					style="visibility: hidden; text-align: center; color: #e2110d; color: #e2110d; font-size: 93%; font-weight: bold;">Email
					or Password invalid, please verify</p>
				<%--       </c:if> --%>
				<button class="btn btn-lg btn-primary login_btn" name="Submit"
					value="Login" type="Submit">Login</button>
			</form>
			<form action="/miliu/registration" method="GET">
				<button
					style="margin-top: 2%; float: right; background-color: white; color: blue; text-decoration: underline;"
					type="Submit" class="btn">Register Here</button>
			</form>
			<div style="margin-top: 15%; text-align: center;">
				<span> <b><i>miliu</i></b> AWS DevOps Training
				</span>
			</div>
		</div>
	</div>
</body>
</html>