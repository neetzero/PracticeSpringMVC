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
<link href="${pageContext.request.contextPath}/theme/metro/css/metro.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/theme/metro/css/metro-icons.min.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/metro/css/metro-responsive.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/metro/css/metro-schemes.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        html, body {
            height: 100%;
        }
        body {
        }
        .page-content {
            padding-top: 3.125rem;
            min-height: 100%;
            height: 100%;
        }
        .table .input-control.checkbox {
            line-height: 1;
            min-height: 0;
            height: auto;
        }

		@media screen and (min-width: 640px) and (max-width: 800px){
		
		}

        @media screen and (max-width: 640px){
            #cell-sidebar {
                flex-basis: 52px;
            }
            #cell-content {
                flex-basis: calc(100% - 52px);
            }
        }
    </style>
<script	src="${pageContext.request.contextPath}/theme/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/theme/metro/js/metro.js"></script>
<script>
$(function(){
    $('.sidebar').on('click', 'li', function(){
        if (!$(this).hasClass('active')) {
            $('.sidebar li').removeClass('active');
            $(this).addClass('active');
        }
    });
    $("#logout").on("click",function(e){
    	if(confirm('<s:message code="logout.confirm"/>')){
    		$('#logoutForm').submit();	
    	};
	});
    
});

</script>
<%-- <script src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap.min.js"></script> --%>
<sitemesh:write property='head' />
</head>

<body>
 <%
        User loginUser = (User) session.getAttribute("LoginUser");
 		loginUser = loginUser == null? new User(): loginUser;
 		//List<Menu> menus = loginUser.getMenus();
%>
<form id="logoutForm" action="logout" method="post" >
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="logout" value="logout" />
</form>
	<%-- 上半部 --%>
    <div class="app-bar fixed-top darcula" data-role="appbar">
        <a class="app-bar-element branding" href="index"><s:message code="title"/></a>
        <span class="app-bar-divider" ></span>

    <ul class="app-bar-menu place-right">
        <li><a><span class="mif-cog"></span>&nbsp;<c:out value="${sessionScope.LoginUser.getUsername()}"/></a></li>
        <li id="logout"><a><span><s:message code="logout"/></span></a></li>
    </ul>
    </div>
    <div class="page-content">
    <div class="flex-grid no-responsive-future" style="height: 100%;">
    	<div class="row" style="height: 100%">
			<div class="cell size-x200 bg-darkBlue" id="cell-sidebar" style="height: 100%">
				<ul class="v-menu subdown block-shadow-impact min-size-required navy">
	<!-- 			<li class="menu-title">First Title</li> -->
	<!--     		<li><a href="#"><span class="mif-home icon"></span> Home</a></li> -->
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
									out.println("<li class='divider'></li>");
								}
								tempTypeId = typeId;
								out.println("<li><a href='#' class='dropdown-toggle'><span class='mif-folder icon'></span>"+menu.getInterfaceTypename()+"</a>");
								out.println("<ul class='d-menu' data-role='dropdown'>");
								out.println("<li><a href='"+menu.getInterfacePath()+"'><span class='mif-file-empty icon'></span>"+menu.getInterfaceName()+"</a></li>");
							}else{
								out.println("<li><a href='"+menu.getInterfacePath()+"'><span class='mif-file-empty icon'></span>" + menu.getInterfaceName() + "</a></li>");
							}
						}
			 			out.println("</ul>");
					}
					*/%>
					
					<!-- Sample頁 -->
					<li class='divider'></li>
					<li><a href='sample_metro.jsp'><span class='mif-file-empty icon'></span>Sample</a></li>
					<!-- End of Sample頁 -->
				</ul>
			</div>
			<%-- 右半邊的內容頁 --%>
			<div class="cell auto-size padding20 bg-white" id="cell-content">
				<%-- 每頁的title --%>
				<h2 class="text-light"><sitemesh:write property='title' /></h2>
	    		<hr class="thin bg-grayLighter">
			
				<%-- 每頁的body --%>
				<sitemesh:write property='body' />
				<footer class="align-center padding20 text-secondary">
					Copyright © 2017 by et, All Rights Reserved
				</footer>
			</div>
		</div>
	</div>
	</div>
</body>
</html>