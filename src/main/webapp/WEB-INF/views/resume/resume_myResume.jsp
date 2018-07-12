<%@page import="com.spring.resume.EducationVO"%>
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
<link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="resources/css/resume_create.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>

<body class="#eeeeee grey lighten-3" style="width: 100%; height: 100%;">
<div style="overflow: hidden;">
<form id="resumeForm" name="resumeForm" enctype="multipart/form-data" method="post">
	<div class="wrapContainer_create">
		<div class="container_create">
		
			<!-- 이력서 제목 -->
			<c:if test="${empty dto.subject}">
			<div class="subject" style="margin: 5px auto; width: 1300px;">
				<input type="text" maxlength="30" name="subject" class="subject"  placeholder="이력서의 제목을 입력해 주세요." style="color: #8c8c8c; border: 1px solid #dcdcdc; height: 100%; width: 100%; height: 50px; background: white; text-align: center; font-size: 26px; border-radius: 3px;">
			</div>
			</c:if>
			
			<c:if test="${not empty dto.subject}">
			<div style="width: 100%; margin-left: 1100px;">
				<div style="color: blue; width: 250px; height: 25px;">각 항목을 클릭하여 수정하세요.</div>
			</div>
			<div class="subject" style="margin: 5px auto; width: 1300px; margin-bottom: 60px;">
				<input type="text" maxlength="30" value="${dto.subject}" name="subject" class="subject"  placeholder="이력서의 제목을 입력해 주세요." style="border: 1px solid #dcdcdc; height: 100%; width: 100%; height: 50px; background: white; text-align: center; font-size: 26px; border-radius: 3px;">
			</div>
			</c:if>

			<!-- 인적사항 -->
			<h5 class="header">인적사항</h5>
			<div class="wrapProfile">
				<div class="profile">
					<div class="wrapRowProfile">
						<div class="rowProfile">
							<div style="width: 220px;">
								<div class="rowHeaderNameName">이름</div>
								<div class="printName" style="width: 95%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
									<span style="font-weight: bold;">${dto.userName}</span>
								</div>
							</div>
							<div style="width: 210px;">
								<div class="rowHeaderNameBirth">생년월일</div>
								<div class="printBirth" style=" width: 95%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
									<span style="font-weight: bold;">
									${dto.birth}
									</span>
								</div>
							</div>
							<div style="width: 180px;">
								<div class="rowHeaderNameGender">성별</div>
								<div class="printGender" style=" width: 95%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
									<span style="font-weight: bold;">${dto.gender}</span>
								</div>
							</div>
							<div style="width: 465px; padding-right: 20px;">
								<div class="rowHeaderNameEmail">이메일</div>
								<div class="printEmail" style=" width: 95%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
								 	<span style="font-weight: bold;">${dto.email}</span>
								</div>
							</div>
						</div>
						<div class="rowProfile">
							<div style="width: 460px;">
								<div class="rowHeaderNamePhone">전화번호</div>
								<div class="printPhone" style=" width: 97%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
									<span style="font-weight: bold;">${dto.phone}</span>
								</div>
							</div>
							<div style="width: 690px; padding-right: 18px;">
								<div class="rowHeaderNameAddr">주소</div>
								<div class="printAddr" style=" width: 95.5%; height: 45px; border: 1px solid #c8c8c8; border-radius: 3px; margin-top: 10px; padding-top: 10px;">
									<span style="font-weight: bold;">${dto.address}</span>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${empty dto.saveFilename}">
					<div class="wrapImageProfile">
						<div class="rowHeaderNameImage">사진</div>
						<div class="imageProfile">
							<img id="ImageView" style="height: 100%; width: 100%; object-fit: contain">
						</div>
						<div class="fileInput">
							<input type="file" name="upload" class="ImageAdd" id="upload" style="width: 80px;">
						</div>
					</div>
					</c:if>
					<c:if test="${not empty dto.saveFilename}">
					<div class="wrapImageProfile">
						<div class="rowHeaderNameImage">사진</div>
						<div class="imageProfile">
							<img src="<%=cp%>/uploads/${dto.saveFilename}" id="ImageView" style="height: 100%; width: 100%; object-fit: contain">
						</div>
						<div class="fileInput">
							<input type="file" name="upload" class="ImageAdd" id="upload" style="width: 80px;">
						</div>
						<input type="hidden" name="num" value="${dto.resumeNum}">
					</div>
					</c:if>
					<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
					<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
				</div>
			</div>
			
			<!-- 학력추가폼 -->
			<div class="hiddenContainerEducation1" style="display: none;">
				<div class="wrapEducation" id="wrapEducation">
					<div class="education">
						<div class="rowEducation">
							<div style="width: 180px;">
								<div class="rowHeaderNameEducation">학교구분</div>
								<div style="height: 45px; width: 170px; padding-left: 8px;">
									<select name="schoolGrade1" style="display: block; height: 47px; border: 1px solid #dcdcdc;">
										<option disabled="disabled" selected="selected"></option>
										<option value="고등학교">고등학교</option>
										<option value="전문대학">전문대학</option>
										<option value="대학교">대학교</option>
										<option value="대학원">대학원</option>
									</select>
								</div>
							</div>
							<div style="width: 250px;">
								<div class="rowHeaderNameSchool">학교이름</div>
								<input type="text" name="schoolName1" maxlength="6" placeholder="연세"  class="inputSchool" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 250px;">
								<div class="rowHeaderNameMajor">전공</div>
								<input type="text" name="major1" maxlength="6" placeholder="컴퓨터공학"  class="inputMajor" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 180px;">
								<div class="rowHeaderNameScore">학점 / 총점</div>
								<input type="text" name="score1" maxlength="3" placeholder="3.8"  class="inputScore" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 85px; float: left; border-radius: 3px;">
								<select name="totalScore1" style="display: block; height: 47px; border: 1px solid #dcdcdc; width: 85px; float: left;">
									<option disabled="disabled" selected="selected"></option>
									<option value="4.5">4.5</option>
									<option value="4.3">4.3</option>
									<option value="4.0">4.0</option>
									<option value="100">100</option>
								</select>
							</div>
							<div style="width: 120px; margin-left: 10px;">
								<div class="rowHeaderNameIn">입학년월</div>
								<input type="text" name="eduInDate1" maxlength="10" placeholder="2018.03"  class="inputIn" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 120px;">
								<div class="rowHeaderNameOut">졸업년월</div>
								<input type="text" name="eduOutDate1" maxlength="10" placeholder="2018.02"  class="inputOut" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 120px; margin-left: 10px;">
								<div class="rowHeaderNameGraduation">졸업구분</div>
								<select name="graduDivision1" style="display: block; height: 47px; border: 1px solid #dcdcdc; width: 120px; float: left;">
									<option disabled="disabled" selected="selected"></option>
									<option value="졸업">졸업</option>
									<option value="졸업예정">졸업예정</option>
									<option value="수료">수료</option>
									<option value="수료예정">수료예정</option>
									<option value="휴학">휴학</option>
									<option value="중퇴">중퇴</option>
								</select>
							</div>
						</div>
						<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
							<div style="font-size: 20px">
								<button type="button" class="buttonEducationDelete">X</button>
							</div>
						</div>
					</div>
								<input type="hidden" name="userId" value="${dto.userId}">
				</div>
			</div>
			
			<!-- 학력 -->
			<div style="display: flex; width: 100%">
				<div style="width: 130px;"><h5 class="header">학력사항</h5></div>
				<div style="font-size: 14px; padding-top: 10px;">
					<a class="buttonEducationAdd" style="cursor: pointer;">
						<img src="<%=cp%>/resources/Image/button_Img.png" style="width: 50px; margin-top: 7px;">
					</a>
				</div>
			</div>
			
			<c:if test="${fn:length(eduVO) == 0}">		
				<div class="hiddenContainerEducation"></div>
			</c:if>
			
			<c:if test="${fn:length(eduVO) > 0}">
				<div class="hiddenContainerEducation">	
					<c:forEach var="eduDto" items="${eduVO}">
						<div class="wrapEducation" id="wrapEducation">
							<div class="education">
								<div class="rowEducation">
									<div style="width: 180px;">
										<div class="rowHeaderNameEducation">학교구분</div>
										<div style="height: 45px; width: 170px; padding-left: 8px;">
											<select id="schoolGrade" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
												<option disabled="disabled" selected="selected"></option>
												<option value="고등학교" <c:if test="${eduDto.schoolGrade eq '고등학교'}">selected</c:if>>고등학교</option>
												<option value="전문대학" <c:if test="${eduDto.schoolGrade eq '전문대학'}">selected</c:if>>전문대학</option>
												<option value="대학교" <c:if test="${eduDto.schoolGrade eq '대학교'}">selected</c:if>>대학교</option>
												<option value="대학원" <c:if test="${eduDto.schoolGrade eq '대학원'}">selected</c:if>>대학원</option>
											</select>
										</div>
									</div>
									<div style="width: 250px;">
										<div class="rowHeaderNameSchool">학교이름</div>
										<input type="text" value="${eduDto.schoolName}" maxlength="10" placeholder="연세"  class="inputSchool" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 250px;">
										<div class="rowHeaderNameMajor">전공</div>
										<input type="text" value="${eduDto.major}" maxlength="6" placeholder="컴퓨터공학"  class="inputMajor" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 180px;">
										<div class="rowHeaderNameScore">학점 / 총점</div>
										<input type="text" value="${eduDto.score}" maxlength="3" placeholder="3.8"  class="inputScore" style="border: 1px solid #dcdcdc; width: 85px; float: left; border-radius: 3px;">
										<select id="totalScore" style="display: block; height: 47px; border: 1px solid #dcdcdc; width: 85px; float: left;">
											<option disabled="disabled" selected="selected"></option>
											<option value="4.5" <c:if test="${eduDto.totalScore eq '4.5'}">selected</c:if>>4.5</option>
											<option value="4.3" <c:if test="${eduDto.totalScore eq '4.3'}">selected</c:if>>4.3</option>
											<option value="4.0" <c:if test="${eduDto.totalScore eq '4.0'}">selected</c:if>>4.0</option>
											<option value="100" <c:if test="${eduDto.totalScore eq '100'}">selected</c:if>>100</option>
										</select>
									</div>
									<div style="width: 120px; margin-left: 10px;">
										<div class="rowHeaderNameIn">입학년월</div>
										<input type="text" value="${eduDto.eduInDate}" maxlength="10" placeholder="2018.03"  class="inputIn" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 120px;">
										<div class="rowHeaderNameOut">졸업년월</div>
										<input type="text" value="${eduDto.eduOutDate}" maxlength="10" placeholder="2018.02"  class="inputOut" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 120px; margin-left: 10px;">
										<div class="rowHeaderNameGraduation">졸업구분</div>
										<select id="graduDivision" style="display: block; height: 47px; border: 1px solid #dcdcdc; width: 120px; float: left;">
											<option disabled="disabled" selected="selected"></option>
											<option value="졸업" <c:if test="${eduDto.graduDivision eq '졸업'}">selected</c:if>>졸업</option>
											<option value="졸업예정" <c:if test="${eduDto.graduDivision eq '졸업예정'}">selected</c:if>>졸업예정</option>
											<option value="수료" <c:if test="${eduDto.graduDivision eq '수료'}">selected</c:if>>수료</option>
											<option value="수료예정" <c:if test="${eduDto.graduDivision eq '수료예정'}">selected</c:if>>수료예정</option>
											<option value="휴학" <c:if test="${eduDto.graduDivision eq '휴학'}">selected</c:if>>휴학</option>
											<option value="중퇴" <c:if test="${eduDto.graduDivision eq '중퇴'}">selected</c:if>>중퇴</option>
										</select>
									</div>
								</div>
								<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
									<div style="font-size: 20px">
										<button type="button" class="buttonEducationDelete">X</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<!-- 경력추가폼 -->
			<div class="hiddenContainerCareer1" style="display: none;">
				<div class="wrapCareer" id="wrapCareer">
					<div class="career">
						<div class="rowCareer">
							<div style="width: 270px;">
								<div class="rowHeaderNameCompName">회사명</div>
								<input type="text" name="compName1" maxlength="10" placeholder="(주)노스스타컨설팅"  class="inputCompName" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 270px;">
								<div class="rowHeaderNameDepart">부서명</div>
								<input type="text" name="deptName1" maxlength="7" placeholder="솔루션사업부"  class="inputDepart" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 200px;">
								<div class="rowHeaderNameRank">직급/직책</div>
								<input type="text" name="rank1" maxlength="8" placeholder="사원 / 팀원"  class="inputRank" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 230px;">
								<div class="rowHeaderNameDuty">직무</div>
								<input type="text" name="duty1" maxlength="10" placeholder="웹개발"  class="inputDuty" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 120px;">
								<div class="rowHeaderNameJoin">입사년월</div>
								<input type="text" name="careerInDate1" maxlength="10" placeholder="2018.02"  class="inputJoin" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 120px;">
								<div class="rowHeaderNameResi">퇴사년월</div>
								<input type="text" name="careerOutDate1"  maxlength="10" placeholder="2018.04"  class="inputResi" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
							<div style="width: 120px;">
								<div class="rowHeaderNamePay">연봉</div>
								<input type="text" name="salary1" maxlength="7" placeholder="4800만원"  class="inputPay" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
							</div>
						</div>
						<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
							<div style="font-size: 20px">
								<button type="button" class="buttonCareerDelete">X</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 경력 -->
			<div style="display: flex; width: 100%; margin-top: 60px;">
				<div style="width: 130px;"><h5 class="header">경력사항</h5></div>
				<div style="font-size: 14px; padding-top: 10px;">
					<a class="buttonCareerAdd" style="cursor: pointer;">
						<img src="<%=cp%>/resources/Image/button_Img.png" style="width: 50px; margin-top: 7px;">
					</a>
				</div>
			</div>
			
			<c:if test="${fn:length(careerVO) == 0}">
				<div class="hiddenContainerCareer"></div>
			</c:if>
			
			<c:if test="${fn:length(careerVO) > 0}">
				<div class="hiddenContainerCareer">
					<c:forEach var="careerDto" items="${careerVO}">
						<div class="wrapCareer" id="wrapCareer">
							<div class="career">
								<div class="rowCareer">
									<div style="width: 270px;">
										<div class="rowHeaderNameCompName">회사명</div>
										<input type="text" value="${careerDto.compName}" maxlength="10" placeholder="(주)노스스타컨설팅"  class="inputCompName" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 270px;">
										<div class="rowHeaderNameDepart">부서명</div>
										<input type="text" value="${careerDto.deptName}" maxlength="7" placeholder="솔루션사업부"  class="inputDepart" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 200px;">
										<div class="rowHeaderNameRank">직급/직책</div>
										<input type="text" value="${careerDto.rank}" maxlength="8" placeholder="사원 / 팀원"  class="inputRank" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 230px;">
										<div class="rowHeaderNameDuty">직무</div>
										<input type="text" value="${careerDto.duty}" maxlength="10" placeholder="웹개발"  class="inputDuty" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 120px;">
										<div class="rowHeaderNameJoin">입사년월</div>
										<input type="text" value="${careerDto.careerInDate}" maxlength="10" placeholder="2018.02"  class="inputJoin" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 120px;">
										<div class="rowHeaderNameResi">퇴사년월</div>
										<input type="text" value="${careerDto.careerOutDate}" maxlength="10" placeholder="2018.04"  class="inputResi" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
									<div style="width: 120px;">
										<div class="rowHeaderNamePay">연봉</div>
										<input type="text" value="${careerDto.salary}" maxlength="7" placeholder="4800만원"  class="inputPay" style="border: 1px solid #dcdcdc; width: 90%; border-radius: 3px;">
									</div>
								</div>
								<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
									<div style="font-size: 20px">
										<button type="button" class="buttonCareerDelete">X</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<!-- 자격증 추가 폼 -->
			<div class="hiddenContainerLicense1" style="display: none;">
				<div class="wrapLicense" id="wrapLicense">
					<div class="license">
						<div class="rowLicense">
							<div style="width: 600px;">
								<div class="rowHeaderNameLicense">자격증 명</div>
								<input type="text" name="licenseName1" maxlength="10" placeholder="정보처리기사"  class="inputLicenseName" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 96%; border-radius: 3px;">
							</div>
							<div style="width: 450px;">
								<div class="rowHeaderNamePublish">발행처</div>
								<input type="text" name="licensePublish1" maxlength="10" placeholder="대한상공회의소"  class="inputPublish" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 92%; border-radius: 3px;">
							</div>
							<div style="width: 200px;">
								<div class="rowHeaderNameGet">취득년월</div>
								<input type="text" name="licenseDate1" maxlength="7" placeholder="2018.02"  class="inputGet" style="color: #8c8c8c; border: 1px solid #dcdcdc; width: 94%; border-radius: 3px;">
							</div>
						</div>
						<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
							<div style="font-size: 20px">
								<button type="button" class="buttonLicenseDelete">X</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 자격증 -->
			<div style="display: flex; width: 100%; margin-top: 60px;">
				<div style="width: 130px; float: left;"><h5 class="header">자격사항</h5></div>
				<div style="font-size: 14px; padding-top: 10px; float: right">
					<a class="buttonLicenseAdd" style="cursor: pointer;">
						<img src="<%=cp%>/resources/Image/button_Img.png" style="width: 50px; margin-top: 7px;">
					</a>
				</div>
			</div>
			
			<c:if test="${fn:length(licenVO) == 0}">
				<div class="hiddenContainerLicense"></div>
			</c:if>
			
			<c:if test="${fn:length(licenVO) > 0}">
				<div class="hiddenContainerLicense">
					<c:forEach var="licenseDto" items="${licenVO}">
						<div class="wrapLicense"  id="wrapLicense">
							<div class="license">
								<div class="rowLicense" id="wrapLicense">
									<div style="width: 600px;">
										<div class="rowHeaderNameLicense">자격증 명</div>
										<input type="text" value="${licenseDto.licenseName}" maxlength="10" placeholder="정보처리기사"  class="inputLicenseName" style="border: 1px solid #dcdcdc; width: 96%; border-radius: 3px;">
									</div>
									<div style="width: 450px;">
										<div class="rowHeaderNamePublish">발행처</div>
										<input type="text" value="${licenseDto.licensePublish}" maxlength="10" placeholder="대한상공회의소"  class="inputPublish" style="border: 1px solid #dcdcdc; width: 92%; border-radius: 3px;">
									</div>
									<div style="width: 200px;">
										<div class="rowHeaderNameGet">취득년월</div>
										<input type="text" value="${licenseDto.licenseDate}" maxlength="7" placeholder="2018.02"  class="inputGet" style="border: 1px solid #dcdcdc; width: 94%; border-radius: 3px;">
									</div>
								</div>
								<div style="width: 60px; height: 100px; margin-left: 10px; padding-top: 27px; padding-left: 20px; float: left;">
									<div style="font-size: 20px">
										<button type="button" class="buttonLicenseDelete">X</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
	
			<!-- 희망근무조건 -->
			<c:if test="${empty dto.subject}">
				<div style="margin-top: 70px;">
					<h5 class="header">희망근무조건</h5>
					<div class="wrapHope">
						<div class="hope">
							<div class="rowHope">
								<div style="width:200px;">
									<div class="rowHeaderNameDetail1">직무선택</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="detail1" name="detail1" style="display: block; height: 47px; border: 1px solid #dcdcdc;">
											<option disabled="disabled" selected="selected"></option>
											<c:forEach var="dto" items="${list}">
											<option value="${dto.detail1Code}">${dto.detail1Name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameDetail2">직무상세</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="detail2" name="detail2" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameGest">고용형태</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="gestalt" name="gestalt"  style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
											<option>정규직</option>
											<option>계약직</option>
											<option>비정규직</option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNamePlace">희망근무지</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="place" name="place" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
											<option>서울</option>
											<option>경기도</option>
											<option>강원도</option>
											<option>충청도</option>
											<option>전라도</option>
											<option>경상도</option>
											<option>제주도</option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameWantPay">희망연봉${dto.subject}</div>
									<input type="text"  maxlength="7" name="wantSalary" placeholder="4800만원"  class="inputWantPay" style="text-align: center; color: #8c8c8c; border: 1px solid #dcdcdc; width: 94%; border-radius: 3px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${not empty dto.subject}">
				<div style="margin-top: 70px;">
					<h5 class="header">희망근무조건</h5>
					<div class="wrapHope">
						<div class="hope">
							<div class="rowHope">
								<div style="width:200px;">
									<div class="rowHeaderNameDetail1">직무선택</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="detail1" name="detail1" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
											<c:forEach var="dto" items="${list}">
											<option value="${dto.detail1Code}">${dto.detail1Name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameDetail2">직무상세</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="detail2" name="detail2" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameGest">고용형태</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="gestalt" name="gestalt"  style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
											<option>정규직</option>
											<option>계약직</option>
											<option>비정규직</option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNamePlace">희망근무지</div>
									<div style="height: 45px; width: 170px; padding-left: 8px;">
										<select id="place" name="place" style="display: block; height: 47px; border: 1px solid #dcdcdc; ">
											<option disabled="disabled" selected="selected"></option>
											<option>서울</option>
											<option>경기도</option>
											<option>강원도</option>
											<option>충청도</option>
											<option>전라도</option>
											<option>경상도</option>
											<option>제주도</option>
										</select>
									</div>
								</div>
								<div style="width: 200px;">
									<div class="rowHeaderNameWantPay">희망연봉</div>
									<input type="text" value="${dto.wantSalary}" maxlength="7" name="wantSalary" placeholder="4800만원"  class="inputWantPay" style="text-align: center; border: 1px solid #dcdcdc; width: 94%; border-radius: 3px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="wrapButton">
				<div style=" font-size: 16px; padding-top: 10px; float: right; font-weight: bold;">
					<c:if test="${empty dto.subject}">
						<a href="<%=cp%>/" style="color: black;">
							<button type="button" class="buttonCancle" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;">등록취소</button>
						</a>
						<button type="button" class="buttonSubmit" id="insertResume" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;">등록하기</button>
					</c:if>
					<c:if test="${not empty dto.subject}">
						<a href="<%=cp%>/" style="color: black;">
							<button type="button" class="buttonCancle" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;">수정취소</button>
						</a>
						<button type="button" class="buttonSubmit" id="insertResume" style="width: 100px; height: 50px; border: 1px solid #dcdcdc; border-radius: 3px;">수정하기</button>
					</c:if>
				</div>
			</div>

		</div>	
	</div>

</form>
</div>

<!--  Scripts-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/materialize.js"></script>
<script src="resources/js/init.js"></script>
<script type="text/javascript">

/* ================= 학력, 경력, 자격증 폼 추가/삭제 ================= */
$(document).ready(function() {
	
	// input[type=text] 클릭 시 글자 색상 검정으로 변경
	$("input[type=text]").on("click", function() {
		$(this).css("color", "black");
	});
	
	// 학력추가 버튼 클릭 시 학력 칸 추가/삭제
	$(".buttonEducationAdd").on("click", function() { // 항목 추가 버튼 클릭 시
		var eduForm = $(".hiddenContainerEducation1").html(); // eduForm에 컨테이너 저장
		
		$(".hiddenContainerEducation").append(eduForm); // 해당 위치에 뿌려줌
		
		$(".buttonEducationDelete").on("click", function() { // 항목 삭제 버튼 클릭 시
			$(this).parent().parent().parent().parent().remove(); // 해당 항목 지움
		});
	});
	
	// 버튼 클릭 시 학력 칸 삭제
	$(".buttonEducationDelete").on("click", function() {
		$(this).parent().parent().parent().parent().remove();
	});
	
	// 경력추가 버튼 클릭 시 학력 칸 추가/삭제
	$(".buttonCareerAdd").on("click", function() {
		var careForm = $(".hiddenContainerCareer1").html();
		
		$(".hiddenContainerCareer").append(careForm);
		
		$(".buttonCareerDelete").on("click", function() {
			$(this).parent().parent().parent().parent().remove();
		});
	});
	
	// 버튼 클릭 시 경력 칸 삭제
	$(".buttonCareerDelete").on("click", function() {
		$(this).parent().parent().parent().parent().remove();
	});
	
	// 자격증추가 버튼 클릭 시 학력 칸 추가/삭제
	$(".buttonLicenseAdd").on("click", function() {	
		var licenForm = $(".hiddenContainerLicense1").html();
		
		$(".hiddenContainerLicense").append(licenForm);
		
		$(".buttonLicenseDelete").on("click", function() {
			$(this).parent().parent().parent().parent().remove();
		});
	});
	
	// 버튼 클릭 시 자격증 칸 삭제
	$(".buttonLicenseDelete").on("click", function() {
		$(this).parent().parent().parent().parent().remove();
	});
});


/* ================= 업로드한 파일 미리보기 ================= */
function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
    	$('#ImageView').attr('src', e.target.result); // 해당 위치에 src 속성 넣어줌
	}
      reader.readAsDataURL(input.files[0]);
    }
}

/* ================= 업로드 파일 확장자 및 용량 검사 ================= */
$(document).ready(function() {
    $(".ImageAdd").on('change', function() {
        readURL(this);
        
        // 파일 확장자 확인
        var ext = $(this).val().split(".").pop().toLowerCase();
        if($.inArray(ext, ["gif", "jpg", "jpeg", "png"]) == -1) {
        	alert("gif, jpg, jpeg, png 파일만 업로드 가능합니다.");
        	$(this).val("");
        	return;
        }
        
        // 파일 용량 확인
        var fileSize = this.files[0].size;
        var maxSize = 1024 * 1024;
        if(fileSize > maxSize) {
        	alert("1MB 이하의 파일만 업로드 가능합니다.")
        	$(this).val("");
        }
        
    });
});


/* ================= 저장된 select 값 불러오기 ================= */
$(document).ready(function() {
	
	// 저장된 고용형태가 있을 경우 해당 값 selected
	$("#gestalt option").each(function() {
		if($(this).text() == '${dto.gestalt}') {
			$(this).attr("selected","selected"); 
		}
	});
	
	// 저장된 희망근무지역이 있을 경우 해당 값 selected
	$("#place option").each(function() {
		if($(this).text() == '${dto.place}') {
			$(this).attr("selected","selected"); 
		}
	});
	
	// 대분류 값 확인 및 중분류 값 삭제
	$("#detail1").on("change", function() {
		var detail1Code = $("#detail1").val();
	
		if(detail1Code == "") {
			$("#detail2 option").each(function() {
				$("#detail2:eq(0)").remove(); // 대분류가 비어있으면 중분류 삭제
			});
			$("#detail2").append("<option value='' disabled='disabled'></option>");
			return false;
		}
	
		var url = "<%=cp%>/resume_myResume";
		var param = "detail1Code=" + detail1Code;
	
		$.ajax({
			type:"post"
			, url:url
			, data:param
			, dataType:"json"
			, async: false
			, success:function(data) {
				$("#detail2 option").each(function() {
					$("#detail2 option:eq(0)").remove();
				});
				
				$("#detail2").append("<option value='' disabled='disabled' selected='selected'></option>");
				
				for(var idx = 0; idx < data.list.length; idx++) {
					$("#detail2").append("<option value='" + data.list[idx].detail2Code+"'>" + data.list[idx].detail2Name + "</option>")
				}
			}
			,error:function(e) {
				alert(e.responseText);
			}
		});
	});
	
	// 저장된 직무가 있을 경우 해당 값 selected
	$("#detail1 option").each(function() {
		if($(this).val() == '${dto.detail1}') {
			$(this).attr("selected","selected"); // 대분류에 해당되는 옵션에 selected
			$("#detail1").trigger('change'); // 강제로 change 이벤트
			
			$("#detail2 option").each(function() {
				if($(this).val() == '${dto.detail2}') {
					$(this).attr("selected","selected"); // 대분류에 해당되는 중분류 옵션에 selected
				}
			});
		}
	});
});


/* ================= name 설정 ================= */
$(document).ready(function() {
	$("#insertResume").on("click", function() {

		// 학력 리스트 input
		var education = $(".hiddenContainerEducation > #wrapEducation").length; // 한 컨테이너
		
		for(var i = 0; i < education; i++) { // 컨테이너 개수 만큼
			var inputEducationLength = $(".hiddenContainerEducation1").find("input").length; // 한 컨테이너 안의 input 사이즈
			
			for(var j = 0; j < inputEducationLength; j++) { // 한 컨테이너 input 개수 만큼
				var inputEducationName = $(".hiddenContainerEducation1").find("input").eq(j).attr("name"); // 한 컨테이너 안의 input name
				$(".hiddenContainerEducation > #wrapEducation").eq(i).find("input").eq(j).attr("name", "educationVO[" + i + "]." + inputEducationName.slice(0,-1)); // input name 설정
			}
		}
		
		
		// 학력 리스트 select
		var education = $(".hiddenContainerEducation > #wrapEducation").length;
			
		for(var i = 0; i < education; i++) {
			var selectEducationLength = $(".hiddenContainerEducation1").find("select").length;
			
			for(var y = 0; y < selectEducationLength; y++) {
				var selectEducationName = $(".hiddenContainerEducation1").find("select").eq(y).attr("name");
				$(".hiddenContainerEducation > #wrapEducation").eq(i).find("select").eq(y).attr("name", "educationVO[" + i + "]." + selectEducationName.slice(0,-1));
			}
		}
		
		// 경력 리스트 input
		var career = $(".hiddenContainerCareer > #wrapCareer").length;
		
		for(var i = 0; i < career; i++) {
			var inputCareerLength = $(".hiddenContainerCareer1").find("input").length;
			
			for(var j = 0; j < inputCareerLength; j++) {
				var inputCareerName = $(".hiddenContainerCareer1").find("input").eq(j).attr("name");
				$(".hiddenContainerCareer > #wrapCareer").eq(i).find("input").eq(j).attr("name", "careerVO[" + i + "]." + inputCareerName.slice(0,-1));
			}
		}
		
		// 자격증 리스트 input
		var license = $(".hiddenContainerLicense > #wrapLicense").length;
		
		for(var i = 0; i < license; i++) {
			var inputLicenseLength = $(".hiddenContainerLicense1").find("input").length;
			
			for(var j = 0; j < inputLicenseLength; j++) {
				var inputLicenseName = $(".hiddenContainerLicense1").find("input").eq(j).attr("name");
				$(".hiddenContainerLicense > #wrapLicense").eq(i).find("input").eq(j).attr("name", "licenseVO[" + i + "]." + inputLicenseName.slice(0,-1));
			}
		}
		
	
	var f = document.resumeForm;
	var subjectPattern = /[^가-힣a-zA-Z0-9]/g; // 특수문자
	var payPattern = /^([1-9]{1})([0-9]{2,4})([만]{1}[원]{1})/; // 연봉
	var datePattern = /^[0-9]{4}.[0-9]{2}/; // 날짜
	var scorePattern =  /[0-9]{2,3}/; // 점수
	var selectPattern = /[가-힣0-9]/g; // 셀렉트박스
	
	
	/* ================= 프로파일 검사 ================= */
	// 제목 빈 값, null 검사
	if(f.subject.value == '' || f.subject.value == null) {
		alert("제목을 입력해 주세요.");
		f.subject.focus();
		return false;
	
	// 제목	특수문자 검사
	} else if(subjectPattern.test(f.subject.value)) {
		alert("한글, 영어 숫자만 입력 가능");
		f.subject.focus();
		return false;
	}
	
	
	/* ================= 학력 검사 ================= */
	var school = $(".hiddenContainerEducation > #wrapEducation").length;
	
	// 학력 빈 값 검사
	for(var i = 0; i < school; i++) {
		if($("select[name='educationVO[" + i + "].schoolGrade']").val() == '' || $("select[name='educationVO[" + i + "].schoolGrade']").val() == null) {
			if(typeof $("select[name='educationVO[" + i + "].schoolGrade']").val() != 'undefined') {
				alert("학교구분을 선택해 주세요.");
				$("select[name='educationVO[" + i + "].schoolGrade']").focus();
				return false;
			}
		} else if($("input[name='educationVO[" + i + "].schoolName']").val() == '' || $("input[name='educationVO[" + i + "].schoolName']").val() == null) {
			alert("학교이름을 입력해 주세요.");
			$("input[name='educationVO[" + i + "].schoolName']").focus();
			return false;
		} else if($("input[name='educationVO[" + i + "].major']").val() == '' || $("input[name='educationVO[" + i + "].major']").val() == null) {
			alert("전공을 입력해 주세요.");
			$("input[name='educationVO[" + i + "].major']").focus();
			return false;
		} else if($("input[name='educationVO[" + i + "].score']").val() == '' || $("input[name='educationVO[" + i + "].score']").val() == null) {
			alert("학점을 입력해 주세요.");
			$("input[name='educationVO[" + i + "].score']").focus();
			return false;
		} else if($("select[name='educationVO[" + i + "].totalScore']").val() == '' || $("select[name='educationVO[" + i + "].totalScore']").val() == null) {
			if(typeof $("select[name='educationVO[" + i + "].totalScore']").val() != 'undefined') {
				alert("총점을 선택해 주세요.");
				$("select[name='educationVO[" + i + "].totalScore']").focus();
				return false;
			}
		} else if($("input[name='educationVO[" + i + "].eduInDate']").val() == '' || $("input[name='educationVO[" + i + "].eduInDate']").val() == null) {
			alert("입학년월을 입력해 주세요.");
			$("input[name='educationVO[" + i + "].eduInDate']").focus();
			return false;
		} else if($("input[name='educationVO[" + i + "].eduOutDate']").val() == '' || $("input[name='educationVO[" + i + "].eduOutDate']").val() == null) {
			alert("졸업년월을 입력해 주세요.");
			$("input[name='educationVO[" + i + "].eduOutDate']").focus();
			return false;
		} else if($("select[name='educationVO[" + i + "].graduDivision']").val() == '' || $("select[name='educationVO[" + i + "].graduDivision']").val() == null) {
			if(typeof $("select[name='educationVO[" + i + "].graduDivision']").val() != 'undefined') {
				alert("졸업구분을 선택해 주세요.");
				$("select[name='educationVO[" + i + "].graduDivision']").focus();
				return false;
			}
		}
	} 
	
	
	// 학력 형식 검사
	for(var i = 0; i < school; i++) {
		if(subjectPattern.test($("input[name='educationVO[" + i + "].schoolName']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='educationVO[" + i + "].schoolName']").focus();
			return false;
		} else if(subjectPattern.test($("input[name='educationVO[" + i + "].major']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='educationVO[" + i + "].major']").focus();
			return false;
		} else if(!scorePattern.test($("input[name='educationVO[" + i + "].score']").val())) {
			if(typeof $("input[name='educationVO[" + i + "].score']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='educationVO[" + i + "].score']").focus();
				return false;
			}
		} else if(!datePattern.test($("input[name='educationVO[" + i + "].eduInDate']").val())) {
			if(typeof $("input[name='educationVO[" + i + "].eduInDate']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='educationVO[" + i + "].eduInDate']").focus();
				return false;
			}
		} else if(!datePattern.test($("input[name='educationVO[" + i + "].eduOutDate']").val())) {
			if(typeof $("input[name='educationVO[" + i + "].eduOutDate']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='educationVO[" + i + "].eduOutDate']").focus();
				return false;
			}
		} 
	}
	
	
	/* ================= 경력 검사 ================= */
	var career = $(".hiddenContainerCareer > #wrapCareer").length;
	
	// 경력 빈 값 검사
	for(var i = 0; i < career; i++) {
		if($("input[name='careerVO[" + i + "].compName']").val() == '' || $("input[name='careerVO[" + i + "].compName']").val() == null) {
			alert("회사명을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].compName']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].deptName']").val() == '' || $("input[name='careerVO[" + i + "].deptName']").val() == null) {
			alert("부서명을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].deptName']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].rank']").val() == '' || $("input[name='careerVO[" + i + "].rank']").val() == null) {
			alert("직급/직책을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].rank']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].duty']").val() == '' || $("input[name='careerVO[" + i + "].duty']").val() == null) {
			alert("직무를 입력해 주세요.");
			$("input[name='careerVO[" + i + "].duty']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].careerInDate']").val() == '' || $("input[name='careerVO[" + i + "].careerInDate']").val() == null) {
			alert("입사년월을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].careerInDate']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].careerOutDate']").val() == '' || $("input[name='careerVO[" + i + "].careerOutDate']").val() == null) {
			alert("퇴사년월을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].careerOutDate']").focus();
			return false;
		} else if($("input[name='careerVO[" + i + "].salary']").val() == '' || $("input[name='careerVO[" + i + "].salary']").val() == null) {
			alert("연봉을 입력해 주세요.");
			$("input[name='careerVO[" + i + "].salary']").focus();
			return false;
		}
	}
	
	// 경력 형식 검사
	for(var i = 0; i < career; i++) {
		if(subjectPattern.test($("input[name='careerVO[" + i + "].compName']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='careerVO[" + i + "].compName']").focus();
			return false;
		} else if(subjectPattern.test($("input[name='careerVO[" + i + "].deptName']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='careerVO[" + i + "].deptName']").focus();
			return false;
		} else if(subjectPattern.test($("input[name='careerVO[" + i + "].rank']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='careerVO[" + i + "].rank']").focus();
			return false;
		} else if(subjectPattern.test($("input[name='careerVO[" + i + "].duty']").val())) {
			alert("한글, 영어, 숫자만 입력 가능");
			$("input[name='careerVO[" + i + "].duty']").focus();
			return false;
		} else if(!datePattern.test($("input[name='careerVO[" + i + "].careerInDate']").val())) {
			if(typeof $("input[name='careerVO[" + i + "].careerInDate']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='careerVO[" + i + "].careerInDate']").focus();
				return false;
			}
		} else if(!datePattern.test($("input[name='careerVO[" + i + "].careerOutDate']").val())) {
			if(typeof $("input[name='careerVO[" + i + "].careerOutDate']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='careerVO[" + i + "].careerOutDate']").focus();
				return false;
			}
		} else if(!payPattern.test($("input[name='careerVO[" + i + "].salary']").val())) {
			if(typeof $("input[name='careerVO[" + i + "].salary']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='careerVO[" + i + "].salary']").focus();
				return false;
			}
		}
	}

	
	/* ================= 자격증 검사 ================= */
	var license = $(".hiddenContainerLicense > #wrapLicense").length;
	
	// 자격증 빈 값 검사
	for(var i = 0; i < license; i++) {
		if($("input[name='licenseVO[" + i + "].licenseName']").val() == '' || $("input[name='licenseVO[" + i + "].licenseName']").val() == null) {
			alert("자격증 명을 입력해 주세요.");
			$("input[name='licenseVO[" + i + "].licenseName']").focus();
			return false;
		} else if($("input[name='licenseVO[" + i + "].licensePublish']").val() == '' || $("input[name='licenseVO[" + i + "].licensePublish']").val() == null) {
			alert("발행처를 입력해 주세요.");
			$("input[name='licenseVO[" + i + "].licensePublish']").focus();
			return false;
		} else if($("input[name='licenseVO[" + i + "].licenseDate']").val() == '' || $("input[name='licenseVO[" + i + "].licenseDate']").val() == null) {
			alert("취득년월을 입력해 주세요.");
			$("input[name='licenseVO[" + i + "].licenseDate']").focus();
			return false;
		}
	}
	
	// 자격증 형식 검사	
	for(var i = 0; i < license; i++) {
		if(subjectPattern.test($("input[name='licenseVO[" + i + "].licenseName']").val())) {
			if(typeof $("input[name='licenseVO[" + i + "].licenseName']").val() != 'undefined') {
				alert("한글, 영어, 숫자만 입력 가능");
				$("input[name='licenseVO[" + i + "].licenseName']").focus();
				return false;
			}
		} else if(subjectPattern.test($("input[name='licenseVO[" + i + "].licensePublish']").val())) {
			if(typeof $("input[name='licenseVO[" + i + "].licensePublish']").val() != 'undefined') {
				alert("한글, 영어, 숫자만 입력 가능");
				$("input[name='licenseVO[" + i + "].licensePublish']").focus();
				return false;
			}
		} else if(!datePattern.test($("input[name='licenseVO[" + i + "].licenseDate']").val())) {
			if(typeof $("input[name='licenseVO[" + i + "].licenseDate']").val() != 'undefined') {
				alert("형식에 맞게 입력해 주세요.");
				$("input[name='licenseVO[" + i + "].licenseDate']").focus();
				return false;
			}
		}
	}
	
	
	/* ================= 희망근무조건 검사 ================= */
	
	// 직무 빈 값, null 검사
	if(f.detail1.value == '' || f.detail1.value == null) {
		alert("직무를 선택해 주세요.");
		f.detail1.focus();
		return false;
		
	// 직무상세 빈 값, null 검사
	} else if(f.detail2.value == '' || f.detail2.value == null) {
		alert("직무상세를 선택해 주세요.");
		f.detail2.focus();
		return false;
		
	// 고용형태 빈 값, null 검사
	} else if(f.gestalt.value == '' || f.gestalt.value == null) {
		alert("고용형태를 선택해 주세요.");
		f.gest.focus();
		return false;
		
	// 희망근무지역 빈 값, null 검사
	} else if(f.place.value == '' || f.place.value == null) {
		alert("희망근무지를 선택해 주세요.");
		f.place.focus();
		return false;
		
	// 희망연봉 빈 값, null 검사
	} else if(f.wantSalary.value == '' || f.wantSalary.value == null) {
		alert("희망연봉을 입력해 주세요.");
		f.wantSalary.focus();
		return false;
		
	// 희망연봉 입력형식 검사
	} else if(! payPattern.test(f.wantSalary.value)) {
		alert("형식에 맞게 입력해 주세요.");
		f.wantSalary.focus();
		return false;
	} 
	
	
   	var formData = new FormData(f);
   	var url = "<%=cp%>/resume_myResume/do";
   	
		$.ajax({
			type:"post"
			,url:url
			,processData: false  // file 전송시 필수
			   ,contentType: false  // file 전송시 필수
			   ,data:formData
			,dataType:"json"
			,success:function(data) {
				var state = data.state;
				if(state) {
					alert("이력서가 등록되었습니다.");
					window.location.reload();
				} else {
					alert("이력서 등록에 실패하였습니다.");
				}
			}
			,error:function(e) {
				console.log(e.responseText);
			}
		});
	});
});
</script>

</body>
</html>
