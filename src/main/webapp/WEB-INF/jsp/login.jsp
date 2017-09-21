<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="login" /></title>
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/theme/font-awesome/css/font-awesome.min.css"	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    
    <style>
    body {
  		padding-top: 10%;
  		padding-bottom: 40px;
  		background-color: #00356a;
	}

.form-signin {
  max-width: 50%;
  padding: 15px;
  margin: 0 auto;
  background-color: white;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}

.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

    </style>
</head>
<body>
	<div class="container">
		<div class='jumbotron form-signin'>
		<form class="form-horizontal"  role="form" method="post" action="doLogin">      
		<h3 class="form-signin-heading"><s:message code="title"/></h3>		
		<hr />
		 <div class="form-group">
   			<label for="inputAccount" class="col-sm-2 control-label"><s:message code="account" /></label>
    		<div class="col-sm-10">
      		<input type="text" class="form-control" id="inputAccount" name="username" placeholder="Username">
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="inputPwd" class="col-sm-2 control-label"><s:message code="password" /></label>
    		<div class="col-sm-10">
      		<input type="password" class="form-control" id="inputPwd" name="password" placeholder="Password">
    		</div>
  		</div>
	  	<c:if test="${not empty errMsg}">
  			<p class="text-danger" id='errMessage'><i class='fa fa-times fa-lg'></i>&nbsp;&nbsp;${errMsg}</p>
  		</c:if>
  		<div class="form-group">
    		<div class="col-sm-10 col-md-12">
      		<button type="submit" class="btn btn-lg btn-primary btn-block"><s:message code="login"/></button>
    		</div>
	  	</div>
  		
 		<input type="hidden" name="pagename" value="index">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</div>
		<footer class="footer text-center">
        	<span class="text-muted">Copyright © 2017 by et, All Rights Reserved</span>	
		</footer>
	</div>
<script src="${pageContext.request.contextPath}/theme/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap.min.js"></script>
 <script>
	$(function(){
	 
	});
 </script>  
</body>
</html>