<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

	<!-- 리스트 헤더 -->
	<div class="listHeader" style="background: #eaeaea;">
			<div class="listHeaderName">이름</div>
			<div class="listHeaderGender">성별</div>
		<div class="listHeaderBirth">생년월일</div>
		<div class="listHeaderSummary">이력서 제목</div>
		<div class="listHeaderDate">등록일</div>
	</div>
	<c:forEach var="dto" items="${list}">
	<div class="wrapListOut" id="wrapListOut">
		<div class="listOutName">${dto.userName}</div>
		<div class="listOutGender">${dto.gender}</div>
		<div class="listOutBirth">${dto.birth}</div>
		<div class="listOutSummary">
			<a href="${articleUrl}&resumeNum=${dto.resumeNum}" style="color: black;">
				${dto.subject}
			</a>
		</div>
		<div class="listOutDate">${dto.createDate}</div>
	</div>
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="rows" value="${rows}">
	</c:forEach>
	
	<!-- 페이지 -->
	<c:if test="${dataCount!=0}">
	<table style="width: 100%; margin-top: 10px; border-collapse: collapse;">
		<tr style="font-size: 12px; border-top: 1px solid #d5d5d5;" align="center">
			<td style="padding-top: 10px;">${paging}</td>
		</tr>
	</table>
	</c:if>
