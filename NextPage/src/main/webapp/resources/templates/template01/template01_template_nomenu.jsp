<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<%-- <link href="<c:url value='/resources/css/dashboard_nomenu.css' />" --%>
<!-- 	rel="stylesheet"></link> -->
	
</head>
<body>
	<section id="preScript">
		<tiles:insertAttribute name="preScript" />
	</section>


	<header id="headerMenu">
		<tiles:insertAttribute name="headerMenu" />
	</header>


	<section id="main" style="margin-top:70px;">
		<tiles:insertAttribute name="main" />
	</section>

	<footer id="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	<section id="postScript">
		<tiles:insertAttribute name="postScript" />
	</section>
</body>
</html>