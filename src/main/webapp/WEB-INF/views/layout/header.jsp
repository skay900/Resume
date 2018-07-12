<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script type="text/javascript">
function loginCheckList() {
	var uid = "${sessionScope.member.userId}";
	
	if(!uid) {
		alert("로그인 후 이용 가능합니다.");
	} else {
		location.href="<%=cp%>/resume_list";
	}
}
</script>

</head>
<body>
  <nav class="light-blue lighten-4" role="navigation" style="margin-bottom: 50px;">
    <div class="nav-wrapper container">
    	<div style="float: left; width: 150px; font-size: 30px;">
    		<a href="<%=cp%>/">
    			<img src="<%=cp%>/resources/Image/Logo.png" style="height: 100%; width: 100%; object-fit: contain;">
    		</a>
   		</div>		
   		
   		<c:if test="${sessionScope.member.authority==0 || sessionScope.member.authority==2}">
    	<div style="float: left; width: 150px; font-size: 23px; margin-left: 100px;">
    		<button type="button" onclick="loginCheckList();" style="border: none; background: none; width: 100%; height: 100%"> 리스트 </button>
   		</div>
   		</c:if>
   		
   		<c:if test="${sessionScope.member.authority==1}">
	  		<div style="float: left; width: 150px; font-size: 23px; margin-left: 100px;">
	    		<a href="<%=cp%>/resume_myResume"> 나의 이력서 </a>
	    	</div>
	    </c:if>
	    
    	
    	<c:if test="${empty sessionScope.member}">
    		<div style="float: right; width: 100px; "><a href="<%=cp%>/login"> LOGIN </a></div>
		</c:if>
		<c:if test="${not empty sessionScope.member}">
    		<div style="float: right; width: 100px; "><a href="<%=cp%>/logout"> LOGOUT </a></div>
		</c:if>
    </div>
  </nav>
</body>
</html>