<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	function sendMail() {
		var f = document.mailForm;
		var str;

		str = f.subject.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return;
		}

		str = f.content.value;
		if (!str) {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return;
		}

		f.action = "<%=cp%>/resume_mail/do";
		f.submit();
	}
</script>

<div class="body-container" style="width: 700px; margin-left: 600px;">
	<div class="body-title">
		<h5>
			<span style="font-family: Webdings">2</span> 면접요청하기
		</h5>
	</div>

	<form name="mailForm" method="post" enctype="multipart/form-data">
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tbody id="tb">
				<tr height="40">
					<td width="90px;" style="text-align: left;">
						제&nbsp;&nbsp;&nbsp;&nbsp;목
					</td>
					<td>
						<input type="text" name="subject" maxlength="50" readonly="readonly" value="제목은 자동으로 생성되어 보내집니다." class="boxTF" style="width: 98%; border: 1px solid #bcbcbc;">
					</td>
				</tr>
				<tr>
					<td width="100" style="text-align: left; padding-top: 5px;" valign="top">
						내&nbsp;&nbsp;&nbsp;&nbsp;용
					</td>
					<td valign="top" style="padding: 5px 0px 5px 0px;">
						<textarea name="content" rows="12" maxlength="690" class="boxTA"style="width: 98%; height: 230px;"></textarea>
					</td>
				</tr>
			</tbody>
		</table>

		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<tr height="45">
				<td align="center">
					<button type="button" class="btn" onclick="sendMail();">
						메일전송
					</button>
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/resume_list';">
						전송취소
					</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="receiver" value="${receiver}">
	</form>
</div>
