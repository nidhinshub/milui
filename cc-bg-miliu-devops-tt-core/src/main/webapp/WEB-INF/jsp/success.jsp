<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
	<%@ page contentType="text/html" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>AWS DevOps Training</title>
    <link rel="stylesheet" type="text/css" th:href="@{/css/login.css}"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body{
    height: 100%;
    background-color: #e6e6e6;
}
.main_container {
	width: 100% !important;
    float: left;
    padding: 50px 0;
    /*background: linear-gradient(to top right, #3399ff 0%, #ff33cc 100%); */
    background:#e6e6e6;
    height: 625px;
}
.text_input{
    padding: 16px !important;
    height: 40px !important;
    border: 1px solid #e0dede !important;
    margin-bottom: 10px;
    }
.login_btn{
    margin-top: 20px;
    height: 47px;
    border-radius: 6px;
    background: #009fdc !important;
    border: 1px solid #00a4e2 !important;
    padding-bottom: 10px;
    outline: none;
    width: 370px !important;
    color: white !important;
    }
    
.reg_btn{
    float: right;
    width: 30%!important;
    margin-top: 40px!important;
    color:white;
    }
.bg_contanier{
    background: white;
    border: 1px solid #d4d4d4;
    max-width: 450px;
    padding: 30px 38px 30px;
    margin: 0 auto;
    border-radius: 10px;
    height: 460px;
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

<body>
 <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<div class="container main_container">
 <!--    <img th:src="@{/images/login.jpg}" class="img-responsive center-block" width="300" height="300" alt="Logo"/> --> 
 <div class="bg_contanier" style="height: 60%;">
    <form name="login" action="/miliu/login" method="GET" class="form-signin" >
        <h3 class="form-signin-heading" th:text="Login"></h3>
        <br/>
        <p style="text-align: left;color: #a94442;font-size: 154%;font-weight: bold;">Welcome  ${user.name}</p>
        <br>

        <p style="text-align: center;color: green;font-size: 154%;">${successMessage}</p>

        <button class="btn btn-lg btn-primary login_btn" name="Submit" value="Login" type="submit"
               >Go to Login Page</button>
      </form>
     
      </div>
</div>
</body>
</html>