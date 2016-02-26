<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JQuery+Java Dshop</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
      <script src="http://jqueryphpstoreshop-demo.livelyworks.net/1.2.0/assets/bootstrap3/js/html5shiv.min.js?1424940583"></script>
      <script src="http://jqueryphpstoreshop-demo.livelyworks.net/1.2.0/assets/bootstrap3/js/respond.min.js?1424940583"></script>
    <![endif]-->

		<!-- CSS -->
		<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="./css/custom.css" type="text/css">
		<link rel="stylesheet" href="./css/footable.core.min.css" type="text/css">
		
			
			
		
		<style type="text/css" id="modalModifiedStyle">
.modal-body {
	max-height: 218.04999999999998px;
}
</style>
		<script src="./js/jquery-1.11.1.min.js" type="text/javascript"
			charset="utf-8">
</script>
	</head>

	<body>

		<!-- Wrap all page content here -->
		<div class="container-flude  main-container">
			<div class="store-header">
				<a class="brand"
					href="./images/JQuery PHP Store - All Products.html"><img
						src="./images/logo.png" alt="" class="logo-image">
				</a>
				
				<a
					href="<%=basePath %>/ShoppingCart.jsp"
					class="show_details_link shopping-cart-btn btn btn-default btn-sm navbar-right hidden-xs hidden-sm">
					<i class="glyphicon glyphicon-shopping-cart"></i>
				</a>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="cartModal">
				<div class="modal-dialog">
			<%@ include file = "ShoppingCart.jsp" %>
				
			
			
			</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- Modal -->
			<!-- /.modal -->

			<nav id="navbar-example" class="navbar navbar-default navbar-static"
				role="navigation">
			
			<div class="collapse navbar-collapse bs-js-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="<%=basePath%>/index.jsp">Home</a>
					</li>
					<li>
						<a
							href="<%=basePath%>/DLogin.jsp">Login</a>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="active">
					<a href="<%=basePath%>/OrderHistory.jsp">history</a>
						
					</li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
			</nav>