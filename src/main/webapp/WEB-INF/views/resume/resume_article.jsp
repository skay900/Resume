<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="resources/css/resume_article.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="resources/js/materialize.js"></script>
<script src="resources/js/bluebird.min.js"></script>
<script src="resources/js/html2canvas.min.js"></script>
<script src="resources/js/jspdf.min.js"></script>

<script type="text/javascript">
// $(document).ready(function(){
// 	$("#download").on("click", function(){
// 		// 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
// 		html2canvas(document.body, {
// 		  onrendered: function(canvas) {
			  
// 		    // 캔버스를 이미지로 변환
// 		    var imgData = canvas.toDataURL('image/png');
		     
// 		    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
// 		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
// 		    var imgHeight = canvas.height * imgWidth / canvas.width;
// 		    var heightLeft = imgHeight;
		     
// 		        var doc = new jsPDF('p', 'mm');
// 		        var position = 0;
		         
// 		        // 첫 페이지 출력
// 		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
// 		        heightLeft -= pageHeight;
		         
// 		        // 한 페이지 이상일 경우 루프 돌면서 출력
// 		        while (heightLeft >= 20) {
// 		          position = heightLeft - imgHeight;
// 		          doc.addPage();
// 		          doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
// 		          heightLeft -= pageHeight;
// 		        }
		 
// 		        // 파일 저장
// 		        doc.save('resume.pdf');
// 		  }
// 		});
// 	})
// });
</script>

</head>

<body class="#eeeeee grey lighten-3" style="width: 100%; height: 100%;">

<div style="overflow: hidden;">
	<div class="wrapContainer_article">
		<div class="container_article">
		
			<!-- 이력서 제목 -->
			<div class="subject" style="margin: 5px auto; width: 1300px;">
				<div class="subject" style="padding-top: 5px; border: 1px solid #dcdcdc; height: 100%; width: 100%; height: 50px; background: white; text-align: center; font-size: 26px; border-radius: 3px;">
					${dtoProfile.subject}
				</div>
			</div>

			<!-- 인적사항 -->
			<h5 class="header">인적사항</h5>
			<div class="wrapProfile">
				<div class="profile">
					<div class="wrapRowProfile">
						<div class="rowProfile">
							<div style="width: 220px;">
								<div class="rowHeaderNameName">이름</div>
								<div class="printName" style=" width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.userName}
								</div>
							</div>
							<div style="width: 210px;">
								<div class="rowHeaderNameBirth">생년월일</div>
								<div class="printBirth" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.birth}
								</div>
							</div>
							<div style="width: 180px;">
								<div class="rowHeaderNameGender">성별</div>
								<div class="printGender" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.gender}
								</div>
							</div>
							<div style="width: 465px; padding-right: 20px;">
								<div class="rowHeaderNameEmail">이메일</div>
								<div class="printEmail" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.email}
								</div>
							</div>
						</div>
						<div class="rowProfile">
							<div style="width: 460px;">
								<div class="rowHeaderNamePhone">전화번호</div>
								<div class="printPhone" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.phone}
								</div>
							</div>
							<div style="width: 690px; padding-right: 18px;">
								<div class="rowHeaderNameAddr">주소</div>
								<div class="printAddr" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
									${dtoUser.address}
								</div>
							</div>
						</div>
					</div>
					<div class="wrapImageProfile">
						<div class="imageProfile">
							<img src="<%=cp%>/uploads/${dtoProfile.saveFilename}" id="ImageView" style="height: 100%; width: 100%; object-fit: contain">
						</div>
					</div>
				</div>
			</div>
		
			<!-- 학력 -->
			<c:if test="${fn:length(eduVO) != 0}">
			<h5 class="header">학력</h5>
				<div class="hiddenContainerEducation">
					<c:forEach var="eduDto" items="${eduVO}">
						<div class="wrapEducation">
							<div class="education">
								<div class="rowEducation">
									<div style="width: 250px;">
										<div class="rowHeaderNameSchool">학교이름</div>
										<div class="printSchool" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.schoolName}${eduDto.schoolGrade}
										</div>
									</div>
									<div style="width: 250px;">
										<div class="rowHeaderNameMajor">전공</div>
										<div class="printMajor" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.major}
										</div>
									</div>
									<div style="width: 180px;">
										<div class="rowHeaderNameScore">학점 / 총점</div>
										<div class="printScore" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.score} / ${eduDto.totalScore}
										</div>
									</div>
									<div style="width: 120px; margin-left: 10px;">
										<div class="rowHeaderNameIn">입학년월</div>
										<div class="printIn" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.eduInDate}
										</div>
									</div>
									<div style="width: 120px;">
										<div class="rowHeaderNameOut">졸업년월</div>
										<div class="printOut" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.eduOutDate}
										</div>
									</div>
									<div style="width: 120px; margin-left: 10px;">
										<div class="rowHeaderNameGraduation">졸업구분</div>
										<div class="printGraduation" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
											${eduDto.graduDivision}
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<!-- 경력 -->
			<c:if test="${fn:length(careerVO) != 0}">
			<h5 class="header">경력</h5>
			<div class="hiddenContainerCareer">
				<c:forEach var="careerDto" items="${careerVO}">
					<div class="wrapCareer">
						<div class="career">
							<div class="rowCareer">
								<div style="width: 270px;">
									<div class="rowHeaderNameCompName">회사명</div>
									<div class="printCompName" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.compName}
									</div>
								</div>
								<div style="width: 270px;">
									<div class="rowHeaderNameDepart">부서명</div>
									<div class="printDepart" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.deptName}
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameRank">직급/직책</div>
									<div class="inputRank" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.rank}
									</div>
								</div>
								<div style="width: 230px;">
									<div class="rowHeaderNameDuty">직무</div>
									<div class="printDuty" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.duty}
									</div>
								</div>
								<div style="width: 120px;">
									<div class="rowHeaderNameJoin">입사년월</div>
									<div class="printJoin" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.careerInDate}
									</div>
								</div>
								<div style="width: 120px;">
									<div class="rowHeaderNameResi">퇴사년월</div>
									<div class="printResi" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.careerOutDate}
									</div>
								</div>
								<div style="width: 120px;">
									<div class="rowHeaderNamePay">연봉</div>
									<div class="printPay" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${careerDto.salary}
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			</c:if>
			
			<!-- 자격증 -->
			<c:if test="${fn:length(licenVO) != 0}">
			<h5 class="header">자격증</h5>
			<div class="hiddenContainerLicense">
				<c:forEach var="licenseDto" items="${licenVO}">
					<div class="wrapLicense">
						<div class="license">
							<div class="rowLicense">
								<div style="width: 600px;">
									<div class="rowHeaderNameLicense">자격증 명</div>
									<div class="printLicenseName" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${licenseDto.licenseName}
									</div>
								</div>
								<div style="width: 450px;">
									<div class="rowHeaderNamePublish">발행처</div>
									<div class="printPublish" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${licenseDto.licensePublish}
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameGet">취득월</div>
									<div class="printGet" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
										${licenseDto.licenseDate}
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			</c:if>
			<!-- 희망근무조건 -->
			<h5 class="header">희망근무조건</h5>
			<div class="wrapHope">
				<div class="hope">
					<div class="rowHope">
						<div style="width:200px;">
							<div class="rowHeaderNameDetail1">직무선택</div>
							<div style="height: 45px; width: 170px; padding-left: 8px; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
								${dtoHope.detail1}
							</div>
						</div>
						<div style="width: 200px;">
							<div class="rowHeaderNameDetail2">직무상세</div>
							<div style="height: 45px; width: 170px; padding-left: 8px; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
								${dtoHope.detail2}
							</div>
						</div>
						<div style="width: 200px;">
							<div class="rowHeaderNameGest">교용형태</div>
							<div style="height: 45px; width: 170px; padding-left: 8px; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
								${dtoHope.gestalt}
							</div>
						</div>
						<div style="width: 200px;">
							<div class="rowHeaderNamePlace">희망근무지</div>
							<div style="height: 45px; width: 170px; padding-left: 8px; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
								${dtoHope.place}
							</div>
						</div>
						<div style="width: 200px;">
							<div class="rowHeaderNameWantPay">희망연봉</div>
							<div class="inputWantPay" style="width: 99%; border: 1px solid #bcbcbc; height: 35px; padding-top: 5px; border-radius: 3px;">
								${dtoHope.wantSalary}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form name="interviewForm" method="post">
			<div class="wrapButton">
				<div style=" font-size: 16px; padding-top: 10px; float: right; font-weight: bold;">
					<button type="button" onclick="mailSend();" id="interview" class="buttonLicenseAdd" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;"><span style="color: black;">면접요청</span></button>
					<button type="button" id="download" class="buttonLicenseAdd" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;"><span style="color: black;">다운로드</span></button>
				</div>
			</div>
			<input type="hidden" name="receiver" value="${dtoUser.email}">
		</form>
	</div>
</div>

<script type="text/javascript">
function mailSend() {
	var f = document.interviewForm;
	
	f.action = "<%=cp%>/resume_mail";
	f.submit();
}
</script>

</body>
</html>
