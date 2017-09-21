<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="title" /></title>
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/font-awesome/css/font-awesome.min.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/nav.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script	src="${pageContext.request.contextPath}/theme/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/theme/moment.js"></script>
<script>
	$(function() {
		$('#doLogout').click(function(){
			$('#logoutForm').submit();
		});
	})
</script>
<sitemesh:write property='head' />
</head>

<body>
	<%
		User loginUser = (User) session.getAttribute("LoginUser");
		loginUser = loginUser == null ? new User() : loginUser;
		//List<Menu> menus = loginUser.getMenu();
	%>
	<!-- 登出用form -->
	<form id="logoutForm" action="logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="logout" value="logout" />
	</form>
	<!-- 左半邊menu -->
	<div class="nav-side-menu">
		<!-- title -->
		<div class="brand">
			<s:message code="title" /><br>
		</div>
		<!-- 寬度小於767時顯示menu按鈕 -->
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">
				<li class='login-user collapsed' data-toggle='collapse' data-target='#login-user'>
					<a href="#">
						<i class="fa fa-user fa-lg"></i>
						<s:message code="user" /> : <c:out value="${sessionScope.LoginUser.getUsername()}"/><span class="arrow"></span>
					</a>
					<ul class='sub-menu collapse' id='login-user'>
						<li>
							<a href="#">
								<i class="fa fa-cog fa-lg"></i>
								<s:message code="user.data.modify"/>
								
							</a>
						</li>
						<li>
							<a href="#" role='button' id='doLogout'>
  								<i class="fa fa-sign-out"></i>
  								<s:message code="logout"/>
							</a>
						</li>
					</ul>
				</li>
				<%/*
					//左半邊的Menu
					if(menus != null && !menus.isEmpty()){
			 			Short tempTypeId = 0;
			 			for(int i=0; i<menus.size(); i++){
			 				Interface menu = menus.get(i);
							Short typeId = menus.get(i).getInterfaceTypeid();
							if(typeId != tempTypeId){
								//這段補最底下的end tag
								if(tempTypeId != 0){
									out.println("</ul>");
								}
								tempTypeId = typeId;
								out.println("<li data-toggle='collapse' data-target='#menu"+typeId+"'><a href='#'><i class='fa fa-lg'></i>"+menu.getInterfaceTypename()+"<span class='arrow'></span></a>");
								out.println("<ul class='sub-menu collapse' id='menu"+typeId+"'>");
								out.println("<li><a href='"+menu.getInterfacePath()+"'><i class='fa fa-angle-right fa-lg'></i>"+menu.getInterfaceName()+"</a></li>");
							}else{
								out.println("<li><a href='"+menu.getInterfacePath()+"'><i class='fa fa-angle-right fa-lg'></i>"+ menu.getInterfaceName() + "</a></li>");
							}
						}
			 			out.println("</ul>");
					}
				*/%>
				
<!-- 				<li data-toggle="collapse" data-target="#service" class="collapsed"> -->
<!-- 					<a href="#"> -->
<!-- 						<i class="fa fa-globe fa-lg"></i> Services<span	class="arrow"></span> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu collapse" id="service"> -->
<!-- 						<li>New Service 1</li> -->
<!-- 						<li>New Service 2</li> -->
<!-- 						<li>New Service 3</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->

				<li><a href="sample.jsp"> <i class="fa fa-paw fa-lg"></i> Sample</a></li>

			</ul>
		</div>
	</div>
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">
					<!-- 每頁的title會顯示在這裡 -->
					<sitemesh:write property='title' />
				</h1>
				<div class="">
					<!-- 每頁的body會顯示在這裡 -->
					<sitemesh:write property='body' />
				</div>
				<footer class="text-center text-muted"> Copyright © 2017 by et, All Rights Reserved </footer>
			</div>
		</div>
	</div>

</body>
</html>