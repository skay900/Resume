<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>

<%response.setHeader("Cache-Control","no-store"); %>

<!-- CSS  -->
<link href="resources/css/resume_main.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body style="width: 100%; height: 100%; background: white;">
<body style="width: 100%; height: 100%; background: white;">
<div class="wrapContainer_main">
	<div class="container_main">
		<a href="#" id="zoomIn">
			<img src="<%=cp%>/resources/Image/job.jpg" class="img" style="width: 100%; height: 100%; object-fit: contain;"/>
		</a>
	</div>
</div>
</body>
</html>