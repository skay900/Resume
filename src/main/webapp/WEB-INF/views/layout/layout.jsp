<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>	
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<style type="text/css">

</style>
</head>
<body>
	<div>
	    <tiles:insertAttribute name="header"/>
	</div>
		
	<div>
	    <tiles:insertAttribute name="body"/>
	</div>
	
	<div>
	    <tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>