<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title><tiles:getAsString name="title" /></title>
</head>
<body>

<tilesx:useAttribute name="current"/>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
		<a class="navbar-brand" href="<spring:url value="/index"/>">Java
			Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="${current=='index' ? 'active' : '' }"><a class="nav-link"
					href="<spring:url value="/index"/>">Home</a></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="${current=='users' ? 'active' : '' }"><a class="nav-link" href='<spring:url value="/users"/>'>Users</a></li>
				</security:authorize>
				<li class="${current=='register' ? 'active' : '' }"><a class="nav-link" href='<spring:url value="/register"/>'>Register</a></li>
				<security:authorize access="! isAuthenticated()">
				<li class="${current=='login' ? 'active' : '' }"><a class="nav-link" href='<spring:url value="/login"/>'>Login</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
				<li class="${current=='users' ? 'active' : '' }"><a class="nav-link" href='<spring:url value="/account"/>'>My Account</a></li>
				<li><a class="nav-link" href='<spring:url value="/logout"/>'>Logout</a></li>
				</security:authorize>
			</ul>

		</div>
	</nav>
	<div class="container">
	
		<tiles:insertAttribute name="body" />
		<center>
			<tiles:insertAttribute name="footer" />
		</center>
	</div>
</body>
</html>