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

<%response.setHeader("Cache-Control","no-store"); %>

<!-- CSS  -->
<link href="resources/css/resume_login.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<script type="text/javascript">
function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요.");
        f.userId.focus();
        return;
    }

    str = f.password.value;
    if(!str) {
        alert("패스워드를 입력하세요.");
        f.password.focus();
        return;
    }
    
    

    f.action = "<%=cp%>/login";
    f.submit();
}

function onEnterLogin(){
	// 로그인 엔터키
	var keyCode = window.event.keyCode;
	      
	if (keyCode == 13) { 
	   $("#login:button").trigger('click');   
	}   
}
 
//input[type=text] 클릭 시 글자 색상 검정으로 변경
$(document).ready(function(){
	$("input[type]").on("click", function(){
		$(this).css("color", "black");
	});
});


</script>

</head>
<body style="width: 100%; height: 100%; background: white;" onkeydown="javascript:onEnterLogin();">
<div class="wrapContainer_login">
	<div class="container_login">
		<form name="loginForm" method="post">
		<div style="width: 30%; height: 370px; border: 1px solid #dcdcdc; margin: 0px auto; margin-top: 150px;">
			<h5 style="text-align: center; margin: 0px auto; line-height: 100px;"> L O G I N </h5>
			<div style="width: 350px; height: 45px; margin: 0xp auto; margin-left: 20px; margin-bottom: 30px;">
				<input type="text" value="USER ID" name="userId" id="userId" onfocus="this.value=''" style="color:#8c8c8c; border: 1px solid #dcdcdc; border-radius: 3px; text-indent: 15px;">
			</div>
			<div style="width: 350px; height: 45px; margin: 0xp auto; margin-left: 20px; margin-bottom: 30px;">
				<input type="password" value="PASSWORD" name="password" id="password" onfocus="this.value=''" style="color: #8c8c8c; border: 1px solid #dcdcdc; border-radius: 3px; text-indent: 15px;">
			</div>
			<div style="width: 350px; height: 45px; margin: 0xp auto; margin-left: 20px; margin-bottom: 20px;">
				<button type="button"  id = "login" onclick="sendLogin();" style="width: 100%; height: 100%; background: white; border: 1px solid black; border-radius: 3px;">Login</button>
			</div>
			<div style="text-align: center;">
				<span style="font-size: 12px; color: blue;">${message}</span>
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>