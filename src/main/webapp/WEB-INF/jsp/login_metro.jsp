<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includeHeader.jsp"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="login" /></title>
<%-- <link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> --%>
<%-- <link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" > --%>
<%-- <link href="${pageContext.request.contextPath}/theme/bootstrap/css/main.css" rel="stylesheet" > --%>
<link href="${pageContext.request.contextPath}/theme/metro/css/metro.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/theme/metro/css/metro-icons.min.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/metro/css/metro-responsive.min.css" rel="stylesheet">
 <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
    .login-form {
    	width: 25rem;
    	height: 23rem;
    	position: fixed;
    	top: 10%;
    	left: 50%;
    	margin-left: -12.5rem;
    	background-color: white;
    	opacity: 1;
    	-webkit-transform: scale(1);
    	transform: scale(1);
    }
    </style>
</head>
<body class="bg-darkCobalt">
	<div class="login-form padding20 block-shadow">
		<form role="form" method="post" id='loginForm' action="doLogin" data-role="validator">      
		<h3 class="text-light"><s:message code="title"/></h3>		
		<hr class="thin" />
		<br />
  			<div class="input-control text full-size" data-role="input">
    			<label for="inputAccount"><s:message code="account" /></label>
    			<input type="text" id="inputAccount" placeholder="Username" name="username" data-validate-func="required"/>
    			<button class="button helper-button clear"><span class="mif-cross"></span></button>
  			</div>
  			<br/>
  			<br/>
  			<div class="input-control text full-size" data-role="input">
    			<label for="inputPwd"><s:message code="password" /></label>
    			<input type="password" id="inputPwd" placeholder="Password" name="password" data-validate-func="required"/>
    			<button class="button helper-button reveal"><span class="mif-looks"></span></button>
  			</div>
  			<br/>
			<br/>
			<br/>

			<div class="form-actions">
  				<button type="submit" class="button primary"><s:message code="login"/></button>
				<button type="button" id="register" class="button"><s:message code="register"/></button>
				<label class="text-light fg-red" id='errMessage'>${errMsg} </label>
			</div>
  			<input type="hidden" name="pagename" value="index">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	
		<footer class="align-center padding10 text-secondary">
			Copyright © 2017 by et, All Rights Reserved
		</footer>
	</div>

<script src="${pageContext.request.contextPath}/theme/jquery-3.2.1.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/theme/metro/js/metro.js"></script>
 <script>
 $(function(){
	$("#register").click(function(){
		window.location = "register.jsp";
	});
/*	$("#loginForm").submit(function(e) {
		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		$.ajax({
			url : formURL,
			type: "POST",
			data : postData,
			success:function(data, textStatus, jqXHR) {
				//data: return data from server
				var code = data.errCode;
				var message = data.errMsg;
				goPage(code, message);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				//if fails
				alert('error : ' + textStatus);
				console.log(errorThrown);
			}
		});
	    e.preventDefault();	//STOP default action
	    //e.unbind(); //unbind. to stop multiple form submit.
	});*/
});

 </script>  
</body>
</html>