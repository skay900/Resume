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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="resources/css/resume_create.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="resources/css/resume_list.css" type="text/css" rel="stylesheet" media="screen,projection"/>


<style type="text/css">
a:hover {
	color: red;
}
</style>
</head>

<body style="width: 100%; height: 100%; background: white;">
<div style="overflow: hidden;">
	<div class="wrapContainer_list">
		<div class="container_list">
		
			<!-- 구분, 검색 -->
			<div class="wrapSearch">
				<div class="searchKeywordWrap">
					<div style="width: 80px;float: left; margin-right: 5px;">
						<select name="searchKey" id="searchKey" style="display: block; height: 40px; border: 1px solid #dcdcdc; border-radius: 3px;">
							<option value="userName">이름</option>
							<option value="subject">제목</option>
							<option value="createDate">등록일</option>
						</select>
					</div>
					<div class="searchKeyword">
						<input type="text" name="searchValue" id="searchValue" class="searchInput" style=" border: 1px solid #dcdcdc; width: 98%; height: 38px; border-radius: 3px;">
						<input type="hidden" name="rows" value="${rows}">
					</div>	
					<div class="searchButtonWrap">
						<button type="button" onclick="searchList();" style="width: 80px; height: 40px; border: 1px solid #dcdcdc; border-radius: 3px;">검색</button>
					</div>
				</div>
			</div>
			
		<div id="ajaxwrap">
			<!-- 리스트 헤더 -->
			<div class="listHeader" style="background: #eaeaea;">
 				<div class="listHeaderName">이름</div>
 				<div class="listHeaderGender">성별</div>
				<div class="listHeaderBirth">생년월일</div>
				<div class="listHeaderSummary">이력서 제목</div>
				<div class="listHeaderDate">등록일</div>
			</div>
			
			<!-- 리스트 출력 -->
			<c:forEach var="dto" items="${list}">
			<div class="wrapListOut" id="wrapListOut">
				<div class="listOutName">${dto.userName}</div>
				<div class="listOutGender">${dto.gender}</div>
				<div class="listOutBirth">${dto.birth}</div>
				<div class="listOutSummary">
					<a href="${articleUrl}&resumeNum=${dto.resumeNum}" style="color: black;">
						${dto.subject}${dto.detail1}
					</a>
				</div>
				<div class="listOutDate">${dto.createDate}</div>
			</div>
			</c:forEach>
			
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="rows" value="${rows}">
			
			<form name="customerSearchForm" action="" method="post">
			<input type="hidden" name="searchKey" value="subject">
   			<input type="hidden" name="searchValue" value="">
			</form>
			
			<!-- 페이지 -->
			<c:if test="${dataCount!=0}">
			<table style="width: 100%; margin-top: 10px; border-collapse: collapse;">
				<tr style="font-size: 12px; border-top: 1px solid #d5d5d5;" align="center">
					<td style="padding-top: 10px;">${paging}</td>
				</tr>
			</table>
			</c:if>
		</div>
		</div>
	</div>
</div>
<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="resources/js/materialize.js"></script>
<script type="text/javascript">
function listPage(page) {
	var url="<%=cp%>/resume_listAjax";
	var query="pageNo="+page;
	ajaxHTML(url, query);
}
// 페이징
function ajaxHTML(url, query) {
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data) {
			$("#ajaxwrap").html(data);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

// 검색
function searchList() {
	var url="<%=cp%>/resume_listAjax";
	pageNo=1;
	searchKey=$("#searchKey").val();
	searchValue=$("#searchValue").val();
	var query = "searchKey=" + searchKey + "&searchValue=" + searchValue;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data) {
			$("#ajaxwrap").html(data);
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}
</script>
 </body>
</html>
