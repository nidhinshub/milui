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
	background: #009fdc !important;
	border: 1px solid #00a4e2 !important;
	padding-bottom: 10px;
	outline: none;
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
	max-width: 100%;
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

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
	/* border: 1px solid #c3c3c3; */
	box-shadow: 1px -1px 4px -3px;
}

td, th {
	/* border: 1px solid #e8e8e8; */
	text-align: left;
	padding: 8px;
}

th {
	background-color: #708e8fa1;
}

tr:nth-child(even) {
	background-color: #efefef;
}
</style>

<body>

	<div class="container main_container">

		<!--    <img th:src="@{/images/login.jpg}" class="img-responsive center-block" width="300" height="300" alt="Logo"/> -->
		<div class="bg_contanier" style="height: 100%;">
			<img src="./images/miliu_logo.png"
				class="img-responsive center-block" alt="Logo"
				style="margin-top: -3%; width: 13%; margin-bottom: 0%;
	/* float: left; */ margin-left: -3%;">
			<form action="/miliu/postTransaction" method="GET"
				style="margin-top: -3%; margin-bottom: 19%;">
				<div
					style="display: flex; position: relative; margin-bottom: -2%; margin-top: 1%;">
					<div style="">
						<span
							style="font-size: 150%; /* color: #037522; */ /* color: black; */ font-weight: bold;">Transactions
						</span><br> <span style="font-size: 100%; color: #037522;">
							Last 7 days transactions </span>

					</div>
					<button class="btn btn-lg btn-primary login_btn" name="Submit"
						value="Login" type="Submit" style="position: absolute; right: 0;">View
						all Transactions</button>
				</div>
				<h3 class="form-signin-heading" th:text="Login"></h3>
				<br />
				<table class="table_container">

					<tr class="header_table">
						<th>Account Number</th>
						<th>Customer Number</th>
						<th>Transaction Date</th>
						<th>Recipient</th>
						<th>Description</th>
						<th>Type</th>
						<th>Amount</th>
						<th>Status</th>
					</tr>
					<c:set var="count" value="0" />
					<c:forEach items="${transactionList}" var="transaction">
						<c:if test="${count lt 10 }">
							<tr>
								<td><c:out value="${transaction.accountNumber}" /></td>
								<td><c:out value="${transaction.customerNumber}" /></td>
								<td><c:out value="${transaction.transactionDate}" /></td>
								<td><c:out value="${transaction.recipient}" /></td>
								<td><c:out value="${transaction.txnDescription}" /></td>
								<td><c:out value="${transaction.txnType}" /></td>
								<td><c:out value="${transaction.txnAmount}" /></td>
								<td><c:out value="${transaction.txnStatusCode}" /></td>
								<c:set var="count" value="${count + 1}" />
							</tr>
						</c:if>
					</c:forEach>
				</table>


			</form>
			<form action="/miliu/login" method="GET" style="margin-top: -11%;">
				<button class="btn btn-lg btn-primary login_btn" type="Submit"
					style="padding-right: 0%; margin-top: -3% !important; float: right !important; width: 19% !important; height: 2% !important; background-color: #db3b02cf !important; border-color: #db3b02cf !important;">Logout</button>
			</form>
			<div style="margin-top: 15%; text-align: center;">
				<span> <b><i>miliu</i></b> AWS DevOps Training
				</span>
			</div>
		</div>
	</div>
</body>
</html>